import Helper as helper

class ErrorInfo:
    def __init__(self):
        self.helperObj = helper.Helper()

    def getId(self):
        return self.id_

    def getErrorCodeDetailId(self):
        return self.error_code_detail_id

    def getFileId(self):
        return self.file_id

    def getCreatedAt(self):
        return created_at

    def getUpdatedAt(self):
        return updated_at

    def setId(self, id_):
        self.id_ = id_

    def setErrorCodeDetailId(self, error_code_detail_id):
        self.error_code_detail_id = error_code_detail_id

    def setFileId(self, file_id):
        self.file_id = file_id

    def setCreatedAt(self, created_at):
        self.created_at = created_at

    def setUpdatedAt(self, updated_at):
        self.updated_at = updated_at

    def insert(self, val, conn_obj):
        mycursor = conn_obj.cursor()
        sql = "INSERT INTO error_info (error_code_detail_id, file_id, created_at, updated_at) VALUES ( %s, %s, %s, %s)"
        current_Date = self.helperObj.getCurrentDateTime()
        val.append(current_Date)
        val.append(current_Date)
        mycursor.execute(sql, val)
        conn_obj.commit()
        return mycursor.lastrowid

    def delete(self, conn_obj):
        mycursor = conn_obj.cursor()
        sql = "DELETE FROM error_info WHERE id > 0"
        mycursor.execute(sql)
        conn_obj.commit()
