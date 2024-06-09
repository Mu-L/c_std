#ifndef POSTGRES_H_
#define POSTGRES_H_

#include <stdbool.h>
#include <libpq-fe.h>


typedef struct {
    char* database;
    char* user;
    char* password;
    char* host;
    char* port;
    PGconn *connection;
} Postgres;


typedef struct {
    PGresult *result;

} PostgresResult;

Postgres* postgres_create();

PostgresResult* postgres_query(Postgres* pg, const char* query);
PostgresResult* postgres_list_tables(Postgres* pg);
PostgresResult* postgres_get_table_schema(Postgres* pg, const char* tableName);
PostgresResult* postgres_get_table_columns(Postgres* pg, const char* tableName);
PostgresResult* postgres_get_table_primary_keys(Postgres* pg, const char* tableName); 
PostgresResult* postgres_get_table_foreign_keys(Postgres* pg, const char* tableName); 
PostgresResult* postgres_get_table_indexes(Postgres* pg, const char* tableName); 
PostgresResult* postgres_get_table_size(Postgres* pg, const char* tableName);
PostgresResult* postgres_get_column_details(Postgres* pg, const char* tableName);
PostgresResult* postgres_get_table_constraints(Postgres* pg, const char* tableName);
PostgresResult* postgres_get_result(Postgres* pg);

bool postgres_connect(Postgres* pg);
bool postgres_execute_non_query(Postgres* pg, const char* command);
bool postgres_begin_transaction(Postgres* pg);
bool postgres_commit_transaction(Postgres* pg);
bool postgres_rollback_transaction(Postgres* pg);
bool postgres_table_exists(Postgres* pg, const char* tableName);
bool postgres_execute_prepared(Postgres* pg, const char* stmtName, const char* query, int nParams, const char* const* paramValues);
bool postgres_is_null(const PostgresResult* pgRes, int row, int col);
bool postgres_is_busy(Postgres* pg);
bool postgres_is_non_blocking(const Postgres* pg);

void postgres_init(Postgres* pg, const char* database, const char* user, const char* password, const char* host, const char* port);
void postgres_disconnect(Postgres* pg);
void postgres_clear_result(PostgresResult* pgResult);
void postgres_deallocate(Postgres* pg);
void postgres_print_result(PostgresResult* pgRes);
void postgres_reset(Postgres* pg);
void postgres_trace(Postgres* pg, FILE* stream);
void postgres_un_trace(Postgres* pg);

const char* postgres_get_last_error(Postgres* pg);
const char* postgres_get_value(PostgresResult* pgRes, int row, int col);

char* postgres_db_value(const Postgres* pg);
char* postgres_user_value(const Postgres* pg);
char* postgres_password_value(const Postgres* pg);
char* postgres_host_value(const Postgres* pg);
char* postgres_port_value(const Postgres* pg);
char* postgres_object_id_status(const PostgresResult* pgRes);
char* postgres_command_status(PostgresResult* pgRes);

int postgres_get_affected_rows(Postgres* pg, PostgresResult *pgRes);
int postgres_get_table_row_count(Postgres* pg, const char* tableName);
int postgres_get_table_index_count(Postgres* pg, const char* tableName);
int postgres_num_tuples(const PostgresResult* pgRes);
int postgres_num_fields(const PostgresResult* pgRes);
int postgres_command_tuples(PostgresResult* pgRes);
int postgres_backend_pid(Postgres* pg);
int postgres_binary_tuples(const PostgresResult* pgRes);
int postgres_bytes_size(const PostgresResult* pgRes, int colsNumber);
int postgres_reset_start(Postgres* pg);
int postgres_protocol_version(const Postgres* pg);
int postgres_server_version(const Postgres* pg);
int postgres_socket_descriptor(const Postgres* pg);
int postgres_flush(Postgres* pg);
int postgres_set_non_blocking(Postgres* pg, int state);
int postgres_get_line(Postgres* pg, char* buffer, int length);
int postgres_get_line_async(Postgres* pg, char* buffer, int length);
int postgres_put_line(Postgres* pg, const char* buffer);
int postgres_put_bytes(Postgres* pg, const char* buffer, int bytes);

#endif 