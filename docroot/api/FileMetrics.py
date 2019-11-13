import Helper as helper

class FileMetrics:
    def __init__(self):
        self.helperObj = helper.Helper()


    def getId(self):
        return self.id_

    def getFileInfoId(self):
        return self.file_info_id

    def getCodePercent(self):
        return self.code_percent

    def getDocstringPercent(self):
        return self.docstring_percent

    def getEmptyPercent(self):
        return self.empty_percent

    def getCreatedAt(self):
        return created_at

    def getUpdatedAt(self):
        return updated_at

    def setId(self, id_):
        self.id_ = id_

    def setFileInfoId(self, file_info_id):
        self.file_info_id = file_info_id

    def setCodePercent(self, code_percent):
        self.code_percent = code_percent

    def setDocstringPercent(self, docstring_percent):
        self.docstring_percent = docstring_percent

    def setEmptyPercent(self, empty_percent):
        self.empty_percent = empty_percent

    def setCreatedAt(self, created_at):
        self.created_at = created_at

    def setUpdatedAt(self, updated_at):
        self.updated_at = updated_at


    def insert(self, val, conn_obj):
        mycursor = conn_obj.cursor()
        sql = "INSERT INTO file_metrics (file_info_id, code_percentage, docstring_percentage, comment_percentage, empty_percentage, created_at, updated_at) VALUES ( %s, %s, %s, %s, %s, %s, %s)"
        current_Date = self.helperObj.getCurrentDateTime()
        val.append(current_Date)
        val.append(current_Date)
        mycursor.execute(sql, val)
        conn_obj.commit()
        return mycursor.lastrowid

    def delete(self, conn_obj):
        mycursor = conn_obj.cursor()
        sql = "DELETE FROM file_metrics WHERE id > 0"
        mycursor.execute(sql)
        conn_obj.commit()
