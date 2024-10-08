# Network Lib in C

## Example 1 : First server in `TcpSocket`

`This server listens on a specified port and echoes back any received data to the client. It demonstrates basic server setup, including initialization, socket creation, binding, listening, accepting connections, receiving data, and sending data back.`

```c
#include "fmt/fmt.h"
#include "network/tcp.h"

#define PORT "8080" 
#define BUFFER_SIZE 1024 

int main() {
    TcpSocket listen_socket, client_socket;
    TcpStatus status;
    char recv_buffer[BUFFER_SIZE];
    size_t received, sent;

    // Initialize network API on Windows
    status = tcp_init();
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Network initialization failed.\n");
        return 1;
    }

    // Create TCP socket
    status = tcp_socket_create(&listen_socket);
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Socket creation failed.\n");
        tcp_cleanup();
        return 1;
    }

    // Bind socket to local port
    status = tcp_bind(listen_socket, "0.0.0.0", atoi(PORT));
    if (status != TCP_SUCCESS) {
        fprintf(stderr, "Socket bind failed.\n");
        tcp_close(listen_socket);
        tcp_cleanup();
        return 1;
    }

    // Listen for incoming connections
    status = tcp_listen(listen_socket, 10); // Backlog of 10 connections
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Listen failed.\n");
        tcp_close(listen_socket);
        tcp_cleanup();
        return 1;
    }

    fmt_printf("Server listening on port %s\n", PORT);

    // Accept a connection (blocking call)
    status = tcp_accept(listen_socket, &client_socket);
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Accept failed.\n");
        tcp_close(listen_socket);
        tcp_cleanup();
        return 1;
    }

    fmt_printf("Client connected.\n");

    // Echo loop: receive data and send it back
    while ((status = tcp_recv(client_socket, recv_buffer, BUFFER_SIZE, &received)) == TCP_SUCCESS && received > 0) {
        recv_buffer[received] = '\0'; 
        fmt_printf("Received: %s\n", recv_buffer);

        status = tcp_send(client_socket, recv_buffer, received, &sent);
        if (status != TCP_SUCCESS || sent != received) {
            fmt_fprintf(stderr, "Send failed.\n");
            break;
        }
    }

    fmt_printf("Closing connection.\n");
    tcp_close(client_socket);
    tcp_close(listen_socket);
    tcp_cleanup();

    return 0;
}
```

## Example 2 : client Echo with python example  `TcpSocket`

`A C client connects to a Python server, sends a message, and prints the echoed message received from the server. This example illustrates how to create a TCP client, connect to a server, send and receive data.`

```c
#include "fmt/fmt.h"
#include "network/tcp.h"

#define SERVER_IP "127.0.0.1" 
#define SERVER_PORT "8080"    
#define BUFFER_SIZE 1024      

int main() {
    TcpSocket socket;
    TcpStatus status;
    char send_buffer[BUFFER_SIZE] = "Hello, TCP Server!";
    char recv_buffer[BUFFER_SIZE];
    size_t sent, received;

    // Initialize network API on Windows
    status = tcp_init();
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Network initialization failed.\n");
        return 1;
    }

    // Create TCP socket
    status = tcp_socket_create(&socket);
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Socket creation failed.\n");
        tcp_cleanup();
        return 1;
    }

    // Connect to the server
    status = tcp_connect(socket, SERVER_IP, atoi(SERVER_PORT));
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Connection to server failed.\n");
        tcp_close(socket);
        tcp_cleanup();
        return 1;
    }

    fmt_printf("Connected to server at %s:%s\n", SERVER_IP, SERVER_PORT);

    // Send message to the server
    status = tcp_send(socket, send_buffer, strlen(send_buffer), &sent);
    if (status != TCP_SUCCESS || sent != strlen(send_buffer)) {
        fmt_fprintf(stderr, "Failed to send data.\n");
        tcp_close(socket);
        tcp_cleanup();
        return 1;
    }

    fmt_printf("Sent: %s\n", send_buffer);

    // Receive echo back from the server
    status = tcp_recv(socket, recv_buffer, BUFFER_SIZE, &received);
    if (status == TCP_SUCCESS && received > 0) {
        recv_buffer[received] = '\0'; 
        fmt_printf("Received: %s\n", recv_buffer);
    } 
    else {
        fmt_fprintf(stderr, "Failed to receive data.\n");
    }

    // Clean up
    tcp_close(socket);
    tcp_cleanup();

    return 0;
}
```

`Python Server Code`

```py

import socket

SERVER_IP = '127.0.0.1'
SERVER_PORT = 8080
BUFFER_SIZE = 1024

def main():
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server_socket:
        server_socket.bind((SERVER_IP, SERVER_PORT))
        server_socket.listen(1)
        print(f"Server listening on {SERVER_IP}:{SERVER_PORT}")

        conn, addr = server_socket.accept()
        with conn:
            print(f"Connected by {addr}")
            while True:
                data = conn.recv(BUFFER_SIZE)
                if not data:
                    break  
                print(f"Received: {data.decode('utf-8')}")
                conn.sendall(data)  # Echo back to client

if __name__ == "__main__":
    main()
```


## Example 3 : Non Blocking `TcpSocket` client 

`This client attempts to connect to a server in non-blocking mode, sending a message and waiting for a response without blocking the execution. It shows how to set a socket to non-blocking mode and handle send/receive operations accordingly.`

```c
#include "fmt/fmt.h"
#include "network/tcp.h"
#include "time/time.h"

#define SERVER_IP "127.0.0.1"
#define SERVER_PORT 8080
#define MESSAGE "Hello, non-blocking world!"

int main() {
    TcpSocket socket;
    TcpStatus status;

    // Initialize network API
    status = tcp_init();
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Network initialization failed.\n");
        return -1;
    }

    // Create TCP socket
    status = tcp_socket_create(&socket);
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Socket creation failed.\n");
        tcp_cleanup();
        return -1;
    }

    // Set the socket to non-blocking mode
    status = tcp_set_non_blocking(socket, true);
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Failed to set socket to non-blocking mode.\n");
        tcp_close(socket);
        tcp_cleanup();
        
        return -1;
    }

    // Attempt to connect to the server
    status = tcp_connect(socket, SERVER_IP, SERVER_PORT);
    if (status != TCP_SUCCESS && status != TCP_ERR_CONNECT) {
        fmt_fprintf(stderr, "Connection attempt failed.\n");
        tcp_close(socket);
        tcp_cleanup();
        return -1;
    }

    fmt_fprintf(stdout, "Connection attempt initiated (non-blocking)...\n");

    // Non-blocking send and receive loop
    char buffer[1024];
    size_t sent, received;
    bool messageSent = false;
    bool responseReceived = false;

    while (!messageSent || !responseReceived) {
        if (!messageSent) {
            status = tcp_send(socket, MESSAGE, strlen(MESSAGE), &sent);
            if (status == TCP_SUCCESS) {
                fmt_fprintf(stdout, "Message sent: %s\n", MESSAGE);
                messageSent = true;
            }
        }

        if (!responseReceived) {
            status = tcp_recv(socket, buffer, sizeof(buffer) - 1, &received);
            if (status == TCP_SUCCESS && received > 0) {
                buffer[received] = '\0'; 
                fmt_fprintf(stdout, "Received response: %s\n", buffer);
                responseReceived = true;
            }
        }
        time_sleep(1);
    }

    // Cleanup
    tcp_close(socket);
    tcp_cleanup();

    return 0;
}
```

## Example 4 : get remote and local address with tcp server in `TcpSocket` 

`A server that prints its own and the client's address upon connection. This demonstrates how to retrieve and display the local and remote addresses of a connection`

```c
#include "fmt/fmt.h"
#include "network/tcp.h"

#define PORT 8080
#define BUFFER_SIZE 1024

int main() {
    TcpSocket listen_socket, client_socket;
    TcpStatus status;
    char client_ip[INET6_ADDRSTRLEN];
    unsigned short client_port;
    char server_ip[INET6_ADDRSTRLEN];
    unsigned short server_port;

    status = tcp_init();
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Failed to initialize network.\n");
        return 1;
    }

    status = tcp_socket_create(&listen_socket);
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Failed to create socket.\n");
        tcp_cleanup();
        return 1;
    }

    status = tcp_bind(listen_socket, NULL, PORT);
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Failed to bind socket.\n");
        tcp_close(listen_socket);
        tcp_cleanup();
        return 1;
    }

    status = tcp_listen(listen_socket, 5);
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Failed to listen on socket.\n");
        tcp_close(listen_socket);
        tcp_cleanup();
        return 1;
    }

    status = tcp_get_local_address(listen_socket, server_ip, sizeof(server_ip), &server_port);
    if (status == TCP_SUCCESS) {
        fmt_fprintf(stdout, "Server is listening on %s:%u\n", server_ip, server_port);
    } 
    else {
        fmt_fprintf(stderr, "Failed to get local address.\n");
    }

    fmt_fprintf(stdout, "Waiting for a connection...\n");
    status = tcp_accept(listen_socket, &client_socket);
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Failed to accept connection.\n");
        tcp_close(listen_socket);
        tcp_cleanup();
        return 1;
    }

    status = tcp_get_remote_address(client_socket, client_ip, sizeof(client_ip), &client_port);
    if (status == TCP_SUCCESS) {
        fmt_fprintf(stdout, "Client connected from %s:%u\n", client_ip, client_port);
    } 
    else {
        fmt_fprintf(stderr, "Failed to get client's address.\n");
    }

    tcp_close(client_socket);
    tcp_close(listen_socket);
    tcp_cleanup();

    return 0;
}
```

`python client for connect to server for getting remote address and port`

```py
import socket

SERVER_IP = '127.0.0.1' 
SERVER_PORT = 8080
MESSAGE = "Hello from Python client!"

def main():
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
        try:
            sock.connect((SERVER_IP, SERVER_PORT))
            print(f"Connected to {SERVER_IP}:{SERVER_PORT}")

            sock.sendall(MESSAGE.encode('utf-8'))
            print(f"Sent: {MESSAGE}")

        except socket.error as e:
            print(f"Socket error: {e}")

        finally:
            sock.close()
            print("Connection closed.")

if __name__ == "__main__":
    main()
```

## Example 5 : `SSl` Echo Server in `TcpSocket`

*Create server.ccrt and server.key*
`openssl req -x509 -newkey rsa:4096 -keyout server.key -out server.crt -days 365 -nodes -subj "/C=US/ST=YourState/L=YourCity/O=YourOrganization/CN=yourdomain.com"`

*ssl client connect to our echo server*
`openssl s_client -connect localhost:8443 -debug -showcerts`

`An SSL/TLS server that echoes back received data over a secure connection. This example covers initializing SSL, creating an SSL-enabled socket, performing SSL handshakes, and secure data transmission.`

```c
#include "fmt/fmt.h"
#include "network/tcp.h"

#define PORT "8443"
#define BUFFER_SIZE 1024
#define CERT_FILE "./server.crt"
#define KEY_FILE "./server.key"

int main() {
    TcpSocket listen_socket, client_socket;
    TcpStatus status;
    char recv_buffer[BUFFER_SIZE];
    size_t received, sent;

    // Initialize network and SSL libraries
    status = tcp_init();
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Network initialization failed.\n");
        return 1;
    }

    status = tcp_ssl_init(CERT_FILE, KEY_FILE);
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "SSL initialization failed.\n");
        tcp_cleanup();
        return 1;
    }

    // Create TCP socket
    status = tcp_socket_create(&listen_socket);
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Socket creation failed.\n");
        tcp_ssl_cleanup();
        tcp_cleanup();
        return 1;
    }

    // Enable SSL for the socket
    status = tcp_enable_ssl(listen_socket);
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Enabling SSL failed.\n");
        tcp_close(listen_socket);
        tcp_ssl_cleanup();
        tcp_cleanup();
        return 1;
    }

    // Bind socket to local port
    status = tcp_bind(listen_socket, "0.0.0.0", atoi(PORT));
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Socket bind failed.\n");
        tcp_close(listen_socket);
        tcp_ssl_cleanup();
        tcp_cleanup();
        return 1;
    }

    // Listen for incoming connections
    status = tcp_listen(listen_socket, 10); // Backlog of 10 connections
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Listen failed.\n");
        tcp_close(listen_socket);
        tcp_ssl_cleanup();
        tcp_cleanup();
        return 1;
    }

    fmt_printf("SSL Server listening on port %s\n", PORT);

    // Accept a connection (blocking call)
    status = tcp_accept(listen_socket, &client_socket);
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Accept failed.\n");
        tcp_close(listen_socket);
        tcp_ssl_cleanup();
        tcp_cleanup();
        return 1;
    }

    // Perform SSL handshake
    status = tcp_ssl_accept(client_socket);
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "SSL handshake failed.\n");
        tcp_close(client_socket);
        tcp_close(listen_socket);
        tcp_ssl_cleanup();
        tcp_cleanup();
        return 1;
    }

    fmt_printf("SSL Client connected.\n");

    // SSL echo loop: receive data and send it back
    while ((status = tcp_ssl_recv(client_socket, recv_buffer, BUFFER_SIZE, &received)) == TCP_SUCCESS && received > 0) {
        recv_buffer[received] = '\0';
        fmt_printf("Received: %s\n", recv_buffer);

        status = tcp_ssl_send(client_socket, recv_buffer, received, &sent);
        if (status != TCP_SUCCESS || sent != received) {
            fmt_fprintf(stderr, "SSL send failed.\n");
            break;
        }
    }

    fmt_printf("Closing SSL connection.\n");
    tcp_ssl_close(client_socket);
    tcp_close(listen_socket);
    tcp_ssl_cleanup();
    tcp_cleanup();

    return 0;
}
```

## Example 6 : concurrent server in `TcpSocket`

`This example demonstrates how to set up a secure SSL/TCP server using a custom TCP library, which abstracts the complexity of socket programming and SSL communication. The example covers initializing the network environment, creating a non-blocking TCP socket, configuring SSL, and handling client connections in a multithreaded manner. This approach allows for scalable server applications that can handle multiple client connections concurrently without blocking the main execution thread.`

```c
#include "fmt/fmt.h"
#include "network/tcp.h"
#include "concurrent/concurrent.h"

#define PORT "8443"
#define BUFFER_SIZE 1024
#define CERT_FILE "./server.crt"
#define KEY_FILE "./server.key"

int handle_client(void* arg);

int main() {
    TcpSocket listen_socket;
    
    tcp_init();
    tcp_ssl_init(CERT_FILE, KEY_FILE);

    tcp_socket_create(&listen_socket);
    tcp_set_non_blocking(listen_socket, true);
    tcp_set_reuse_addr(listen_socket, true);
    tcp_bind(listen_socket, NULL, atoi(PORT));
    tcp_listen(listen_socket, 10);

    fmt_printf("SSL Echo Server listening on port %s\n", PORT);

    fd_set master_set;
    FD_ZERO(&master_set);
    FD_SET(listen_socket, &master_set);
    int max_sd = listen_socket;

    while (true) {
        fd_set read_fds = master_set;
        struct timeval timeout;
        timeout.tv_sec = 0; // No wait timeout
        timeout.tv_usec = 10000; // 10ms

        int activity = select(max_sd + 1, &read_fds, NULL, NULL, &timeout);

        if ((activity < 0) && (errno != EINTR)) {
            fmt_printf("select error\n");
        }

        if (FD_ISSET(listen_socket, &read_fds)) {
            TcpSocket* client_socket = malloc(sizeof(TcpSocket)); // Ensure proper error checking in production code
            TcpStatus acceptStatus = tcp_accept(listen_socket, client_socket);
            if (acceptStatus == TCP_SUCCESS) {
                Thread thread_id = NULL;
                thread_create(&thread_id, handle_client, client_socket);
                thread_detach(thread_id);
            } 
            else {
                free(client_socket);
            }
        }
    }

    tcp_close(listen_socket);
    tcp_ssl_cleanup();
    tcp_cleanup();
    return 0;
}

int handle_client(void* arg) {
    TcpSocket client_socket = *(TcpSocket*)arg;
    free(arg); // Free the argument as soon as possible to avoid memory leaks

    tcp_enable_ssl(client_socket);
    if (tcp_ssl_accept(client_socket) != TCP_SUCCESS) {
        tcp_ssl_close(client_socket);
        tcp_close(client_socket);
        return -1;
    }

    char buffer[BUFFER_SIZE];
    size_t received, sent;

    while (tcp_ssl_recv(client_socket, buffer, BUFFER_SIZE, &received) == TCP_SUCCESS && received > 0) {
        tcp_ssl_send(client_socket, buffer, received, &sent);
    }

    tcp_ssl_close(client_socket);
    tcp_close(client_socket);

    return 0;
}
```

## Example 7 : Simple HttpServer with `TcpSocket`\

`This example demonstrates how to create a simple HTTP server in C using the custom TcpSocket and concurrent libraries. The server listens on port 8080 and responds to incoming HTTP requests with a basic HTTP response message. This server is capable of handling multiple client connections concurrently through the use of threads.`

```c
#include "network/tcp.h"
#include "concurrent/concurrent.h"
#include "fmt/fmt.h"

#define SERVER_PORT 8080
#define BUFFER_SIZE 4096

int handle_client(void* arg) {
    TcpSocket client_socket = *(TcpSocket*)arg;
    free(arg); // Free the dynamically allocated memory for the socket

    char buffer[BUFFER_SIZE] = {0};
    size_t received, sent;

    if (tcp_recv(client_socket, buffer, BUFFER_SIZE, &received) == TCP_SUCCESS) {
        fmt_printf("Request:\n%s\n", buffer);

        // Simple HTTP response
        const char* httpResponse = "HTTP/1.1 200 OK\r\n"
                                    "Content-Type: text/plain\r\n"
                                    "Connection: close\r\n"
                                    "\r\n"
                                    "Hello, world! This is a simple HTTP server response.\r\n";

        tcp_send(client_socket, httpResponse, strlen(httpResponse), &sent);
    }

    tcp_close(client_socket);
    fmt_printf("Client disconnected.\n");
    
    return TCP_SUCCESS;
}

int main(void) {
    TcpSocket listen_socket;
    TcpStatus status = tcp_init();

    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Failed to initialize TCP.\n");
        return 1;
    }

    status = tcp_socket_create(&listen_socket);
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Failed to create socket.\n");
        tcp_cleanup();
        return 1;
    }

    status = tcp_bind(listen_socket, NULL, SERVER_PORT);
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Failed to bind socket.\n");
        tcp_close(listen_socket);
        tcp_cleanup();
        return 1;
    }

    status = tcp_listen(listen_socket, 10);
    if (status != TCP_SUCCESS) {
        fmt_fprintf(stderr, "Failed to listen on socket.\n");
        tcp_close(listen_socket);
        tcp_cleanup();
        return 1;
    }

    fmt_printf("HTTP Server listening on port %d\n", SERVER_PORT);

    while (1) {
        TcpSocket* client_socket = (TcpSocket*) malloc(sizeof(TcpSocket));
        if (client_socket == NULL) {
            fmt_fprintf(stderr, "Failed to allocate memory for client socket.\n");
            continue;
        }

        if (tcp_accept(listen_socket, client_socket) == TCP_SUCCESS) {
            Thread client_thread;
            if (thread_create(&client_thread, handle_client, client_socket) != THREAD_SUCCESS) {
                fmt_fprintf(stderr, "Failed to create thread.\n");
                free(client_socket); 
            }
            thread_detach(client_thread);
        } 
        else {
            free(client_socket); 
        }
    }

    tcp_close(listen_socket);
    tcp_cleanup();

    return 0;
}
```

## Example 8: Asynchronous File Server using `TcpSocket`

`This example demonstrates the creation of an asynchronous file server in C, utilizing the custom TcpSocket, fmt, concurrent, and file_io libraries. The server is designed to listen for incoming file requests on port 8080 and serve the requested files back to the client efficiently and concurrently. This example is particularly useful for understanding how to integrate network programming with file I/O and threading for scalable server applications.`

```c
#include "network/tcp.h"
#include "fmt/fmt.h"
#include "concurrent/concurrent.h"
#include "file_io/file_reader.h"

#define SERVER_PORT 8080
#define BUFFER_SIZE 4096
#define MAX_FILENAME_LENGTH 256

int handle_client(void* arg) {
    TcpSocket client_socket = *(TcpSocket*)arg;
    free(arg); 

    char request[BUFFER_SIZE] = {0};
    size_t received;

    // Receive the file request from the client
    if (tcp_recv(client_socket, request, BUFFER_SIZE, &received) != TCP_SUCCESS || received == 0) {
        fmt_fprintf(stderr, "Failed to receive data from client.\n");
        tcp_close(client_socket);
        return -1;
    }

    // Extract the filename from the request
    char* token = strtok(request, " ");
    if (token == NULL || strcmp(token, "GET") != 0) {
        fmt_fprintf(stderr, "Invalid request format.\n");
        tcp_close(client_socket);
        return -1;
    }

    char* filename = strtok(NULL, " ");
    if (filename == NULL) {
        fmt_fprintf(stderr, "Filename not specified in request.\n");
        tcp_close(client_socket);
        return -1;
    }

    // Attempt to open the requested file
    FileReader* reader = file_reader_open(filename, READ_BINARY);
    if (!reader) {
        char* errMsg = "File not found.\n";
        tcp_send(client_socket, errMsg, strlen(errMsg), NULL);
        tcp_close(client_socket);
        return -1;
    }

    // Read the file content and send it to the client
    char file_buffer[BUFFER_SIZE];
    size_t bytes_read;
    while ((bytes_read = file_reader_read(file_buffer, 1, BUFFER_SIZE, reader)) > 0) {
        tcp_send(client_socket, file_buffer, bytes_read, NULL);
    }

    file_reader_close(reader);
    tcp_close(client_socket);
    fmt_printf("File \"%s\" sent successfully.\n", filename);

    return 0;
}

int main(void) {
    TcpSocket listen_socket;
    tcp_init();
    tcp_socket_create(&listen_socket);
    tcp_bind(listen_socket, NULL, SERVER_PORT);
    tcp_listen(listen_socket, 10);

    fmt_printf("File Server listening on port %d\n", SERVER_PORT);

    while (1) {
        TcpSocket* client_socket = malloc(sizeof(TcpSocket));
        if (tcp_accept(listen_socket, client_socket) == TCP_SUCCESS) {
            Thread client_thread = NULL;
            thread_create(&client_thread, handle_client, client_socket);
            thread_detach(client_thread);
        } 
        else {
            free(client_socket);
        }
    }

    tcp_close(listen_socket);
    tcp_cleanup();

    return 0;
}
```

*Client Request in Python*

```py
import socket

# Server configuration
SERVER_IP = '127.0.0.1'
SERVER_PORT = 8080

def request_file(filename):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    
    try:
        sock.connect((SERVER_IP, SERVER_PORT))
        print(f"Connected to {SERVER_IP}:{SERVER_PORT}")

        request_message = f"GET {filename}"
        sock.sendall(request_message.encode('utf-8'))
        print(f"Requested file: {filename}")

        with open(f"received_{filename}", 'wb') as file:
            while True:
                data = sock.recv(4096)
                if not data:
                    break 
                file.write(data)
        
        print(f"File received and saved as received_{filename}")

    except socket.error as e:
        print(f"Socket error: {e}")
    finally:
        sock.close()
        print("Connection closed.")

if __name__ == "__main__":
    filename = input("Enter the filename to request: ")
    request_file(filename)
```


To add your HTTP server example to the README file, you can use the following markdown format:

---

## Example 9 : HTTP Server Example

This example demonstrates how to create a simple HTTP server in C using a custom HTTP library. The server listens on port 8051 and provides two endpoints:

- `/`: Responds with a simple "Hello, World!" message.
- `/echo`: Receives a JSON payload via a POST request and echoes it back in the response.

**Test the endpoints**:
     - `curl http://localhost:8051/` should return "Hello, World!".
     - `curl -X POST http://localhost:8051/echo -H "Content-Type: application/json" -d '{"message": "Hello, world!"}'` should return the JSON message `{"message": "Hello, world!"}`.

### Code

```c
#include "network/http.h"
#include "fmt/fmt.h"
#include <stdlib.h>

void handle_root(HttpRequest* req, HttpResponse* res) {
    (void)req;
    http_set_status(res, 200, "OK");
    http_set_body(res, "Hello, World!");
}

void handle_echo(HttpRequest* req, HttpResponse* res) {
    fmt_printf("Received body: %s\n", req->body);

    if (req->json_body) {
        fmt_printf("Debug: Valid JSON body detected\n");
        http_set_status(res, 200, "OK");
        http_set_json_body(res, json_deep_copy(req->json_body));
    } 
    else {
        http_send_error(res, 400, "Bad Request: Expected JSON body");
    }
}

int main() {
    http_register_route("/", HTTP_GET, handle_root);
    http_register_route("/echo", HTTP_POST, handle_echo);

    fmt_printf("Starting HTTP server on port 8051...\n");
    http_start_server(8051);

    return 0;
}
```


## Example 10 : json api with http and json (add user and get list of users)

- `/users`: this endpoint base on GET method return list of users
- `/users`: this handler get user as json and add to User struct .

**Test the endpoints**:
     - `curl http://localhost:8051/users` should return "Hello, World!".
     - `curl -X POST http://localhost:8051/users -H "Content-Type: application/json" -d '{"name": "amin", "age": 27}'` should return {"message": "User added successfully"}
### Code

```c
#include "network/http.h"
#include "fmt/fmt.h"
#include "json/json.h"
#include "string/std_string.h"


typedef struct {
    char* name;
    int age;
} User;


static User users[10]; 
static size_t user_count = 0;

void handle_get_users(HttpRequest* req, HttpResponse* res) {
    (void)req; 

    JsonElement* users_array = json_create(JSON_ARRAY);
    for (size_t i = 0; i < user_count; i++) {
        JsonElement* user_obj = json_create(JSON_OBJECT);

        JsonElement* name_element = json_create(JSON_STRING);
        name_element->value.string_val = string_strdup(users[i].name);
        json_set_element(user_obj, "name", name_element);

        JsonElement* age_element = json_create(JSON_NUMBER);
        age_element->value.number_val = users[i].age;
        json_set_element(user_obj, "age", age_element);

        json_add_to_array(users_array, user_obj);
    }

    JsonElement* response_json = json_create(JSON_OBJECT);
    json_set_element(response_json, "users", users_array);

    http_set_status(res, 200, "OK");
    http_set_json_body(res, response_json);
}

void handle_add_user(HttpRequest* req, HttpResponse* res) {
    if (req->json_body) {
        JsonElement* name_element = json_get_element(req->json_body, "name");
        JsonElement* age_element = json_get_element(req->json_body, "age");

        if (name_element && name_element->type == JSON_STRING &&
            age_element && age_element->type == JSON_NUMBER &&
            user_count < 10) {

            const char* name = name_element->value.string_val;
            int age = (int)age_element->value.number_val;

            users[user_count].name = string_strdup(name);
            users[user_count].age = age;
            user_count++;

            http_set_status(res, 201, "User Created");

            JsonElement* response_json = json_create(JSON_OBJECT);
            JsonElement* message_element = json_create(JSON_STRING);
            
            message_element->value.string_val = string_strdup("User added successfully");
            json_set_element(response_json, "message", message_element);
            http_set_json_body(res, response_json);
        } 
        else {
            http_send_error(res, 400, "Bad Request: Invalid user data or user limit reached");
        }

    } else {
        http_send_error(res, 400, "Bad Request: Expected JSON body");
    }
}

int main() {
    http_register_route("/users", HTTP_GET, handle_get_users);
    http_register_route("/users", HTTP_POST, handle_add_user);

    fmt_printf("Starting HTTP server on port 8051...\n");
    http_start_server(8051);

    return 0;
}
```

## Example 11 : Create Crud operation and api with http lib (POST, GET, PUT, DELETE)

- `/users`: this endpoint base on GET method return list of users
- `/users`: this handler get user as json and add to User struct .
- `/users/{id}` : this api update user base on id 
- `/users/{id}` : this api delete user base on id

**Test the endpoints**:
- `curl http://localhost:8051/users` should return "Hello, World!".
- `curl -X POST http://localhost:8051/users -H "Content-Type: application/json" -d '{"id": 1, "name": "amin", "age": 27}'` should return {"message": "User added successfully"}
- `curl -X PUT http://localhost:8051/users/1 -H "Content-Type: application/json" -d '{"name": "ali", "age": 25}'` should return {"message": "User updated successfully"}
- `curl -X DELETE http://localhost:8051/users/1` should return {"message": "User deleted successfully"}

    
### code 

```c
#include "network/http.h"
#include "fmt/fmt.h"
#include "json/json.h"
#include "string/std_string.h"

typedef struct {
    int id;
    char* name;
    int age;
} User;

static User users[10];
static size_t user_count = 0;

User* find_user_by_id(int id) {
    for (size_t i = 0; i < user_count; i++) {
        if (users[i].id == id) {
            return &users[i];
        }
    }
    return NULL;
}

int extract_id_from_path(const char* path) {
    const char* last_slash = strrchr(path, '/');
    if (last_slash) {
        return atoi(last_slash + 1);
    }
    return -1;
}

void handle_get_users(HttpRequest* req, HttpResponse* res) {
    (void)req;
    JsonElement* users_array = json_create(JSON_ARRAY);
    for (size_t i = 0; i < user_count; i++) {
        JsonElement* user_obj = json_create(JSON_OBJECT);

        JsonElement* id_element = json_create(JSON_NUMBER);
        id_element->value.number_val = users[i].id;
        json_set_element(user_obj, "id", id_element);

        JsonElement* name_element = json_create(JSON_STRING);
        name_element->value.string_val = string_strdup(users[i].name);
        json_set_element(user_obj, "name", name_element);

        JsonElement* age_element = json_create(JSON_NUMBER);
        age_element->value.number_val = users[i].age;
        json_set_element(user_obj, "age", age_element);

        json_add_to_array(users_array, user_obj);
    }

    JsonElement* response_json = json_create(JSON_OBJECT);
    json_set_element(response_json, "users", users_array);

    http_set_status(res, 200, "OK");
    http_set_json_body(res, response_json);
}

void handle_add_user(HttpRequest* req, HttpResponse* res) {
    if (req->json_body) {
        JsonElement* id_element = json_get_element(req->json_body, "id");
        JsonElement* name_element = json_get_element(req->json_body, "name");
        JsonElement* age_element = json_get_element(req->json_body, "age");

        if (id_element && id_element->type == JSON_NUMBER &&
            name_element && name_element->type == JSON_STRING &&
            age_element && age_element->type == JSON_NUMBER &&
            user_count < 10) {

            int id = (int)id_element->value.number_val;
            if (find_user_by_id(id) == NULL) {
                User new_user;
                new_user.id = id;
                new_user.name = string_strdup(name_element->value.string_val);
                new_user.age = (int)age_element->value.number_val;

                users[user_count++] = new_user;

                http_set_status(res, 201, "User Created");

                JsonElement* response_json = json_create(JSON_OBJECT);
                JsonElement* message_element = json_create(JSON_STRING);

                message_element->value.string_val = string_strdup("User added successfully");

                json_set_element(response_json, "message", message_element);
                http_set_json_body(res, response_json);
            } 
            else {
                http_send_error(res, 400, "User already exists with this ID");
            }
        } 
        else {
            http_send_error(res, 400, "Bad Request: Invalid user data or user limit reached");
        }
    } 
    else {
        http_send_error(res, 400, "Bad Request: Expected JSON body");
    }
}

void handle_update_user(HttpRequest* req, HttpResponse* res) {
    int id = extract_id_from_path(req->path);

    if (id != -1 && req->json_body) {
        User* user = find_user_by_id(id);
        
        if (user) {
            JsonElement* name_element = json_get_element(req->json_body, "name");
            JsonElement* age_element = json_get_element(req->json_body, "age");

            if (name_element && name_element->type == JSON_STRING &&
                age_element && age_element->type == JSON_NUMBER) {

                user->name = string_strdup(name_element->value.string_val);
                if (user->name == NULL) {
                    http_send_error(res, 500, "Internal Server Error: Memory allocation failed");
                    return;
                }
                user->age = (int)age_element->value.number_val;
                http_set_status(res, 200, "User Updated");

                JsonElement* response_json = json_create(JSON_OBJECT);
                JsonElement* message_element = json_create(JSON_STRING);

                message_element->value.string_val = string_strdup("User updated successfully");

                json_set_element(response_json, "message", message_element);
                http_set_json_body(res, response_json);
            } 
            else {
                http_send_error(res, 400, "Bad Request: Invalid user data");
            }
        } 
        else {
            http_send_error(res, 404, "User Not Found");
        }
    } 
    else {
        http_send_error(res, 400, "Bad Request: Missing user ID or JSON body");
    }
}

void handle_delete_user(HttpRequest* req, HttpResponse* res) {
    int id = extract_id_from_path(req->path);
    if (id != -1) {
        for (size_t i = 0; i < user_count; i++) {
            if (users[i].id == id) {
                free(users[i].name);
                for (size_t j = i; j < user_count - 1; j++) {
                    users[j] = users[j + 1];
                }
                user_count--;

                http_set_status(res, 200, "User Deleted");

                JsonElement* response_json = json_create(JSON_OBJECT);
                JsonElement* message_element = json_create(JSON_STRING);

                message_element->value.string_val = string_strdup("User deleted successfully");
                json_set_element(response_json, "message", message_element);
                http_set_json_body(res, response_json);

                return;
            }
        }
        http_send_error(res, 404, "User Not Found");
    } 
    else {
        http_send_error(res, 400, "Bad Request: Missing user ID");
    }
}

int main() {
    http_register_route("/users", HTTP_GET, handle_get_users);
    http_register_route("/users", HTTP_POST, handle_add_user);
    http_register_route("/users/{id}", HTTP_PUT, handle_update_user);
    http_register_route("/users/{id}", HTTP_DELETE, handle_delete_user);

    fmt_printf("Starting HTTP server on port 8051...\n");
    http_start_server(8051);

    return 0;
}
```