import Helper as helper

class Users:

    def insert(self, val, conn_obj):
        mycursor = conn_obj.cursor()
        sql = "INSERT INTO users (user_name, email,activation_key,repository) VALUES (%s, %s, %s, %s)"
        mycursor.execute(sql, val)
        conn_obj.commit()
        return mycursor.lastrowid

    def delete(self, conn_obj):
        mycursor = conn_obj.cursor()
        sql = "TRUNCATE table users"
        mycursor.execute(sql)
        conn_obj.commit()

    def select(self, conn_obj):
        mycursor = conn_obj.cursor()
        sql = "SELECT * from users"
        mycursor.execute(sql)
        return mycursor.fetchall()
