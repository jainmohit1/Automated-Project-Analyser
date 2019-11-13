import Helper as helper

class FileInfo:
    def __init__(self):
        self.helperObj = helper.Helper()


    def getId(self):
        return self.id_

    def getFileName(self):
        return self.file_name

    def getFileType(self):
        return self.file_type

    def getFilePath(self):
        return self.file_path

    def getCreatedAt(self):
        return created_at

    def getUpdatedAt(self):
        return updated_at

    def setId(self, id_):
        self.id_ = id_

    def setFileName(self, file_name):
        self.file_name = file_name

    def setFileType(self, file_type):
        self.file_type = file_type

    def setFileType(self, file_path):
        self.file_path = file_path

    def setCreatedAt(self, created_at):
        self.created_at = created_at

    def setUpdatedAt(self, updated_at):
        self.updated_at = updated_at

    def insert(self, val, conn_obj):
        mycursor = conn_obj.cursor()
        sql = "INSERT INTO file_info (file_name, file_type, file_path, created_at, updated_at) VALUES ( %s, %s, %s, %s, %s)"
        current_Date = self.helperObj.getCurrentDateTime()
        val.append(current_Date)
        val.append(current_Date)
        mycursor.execute(sql, val)
        conn_obj.commit()
        #return mycursor.lastrowid

    def delete(self, conn_obj):
        mycursor = conn_obj.cursor()
        sql = "DELETE FROM file_info WHERE id > 0"
        mycursor.execute(sql)
        conn_obj.commit()

    def select(self, val, conn_obj):
        mycursor = conn_obj.cursor()
        sql = "SELECT id from file_info where file_name = %s and file_path = %s"
        mycursor.execute(sql, val)
        #print("Inside")
        record = mycursor.fetchall()
        #print(record)
        return record[0][0]
        #return mycursor.fetchall()
