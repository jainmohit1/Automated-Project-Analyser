import Helper as helper

class ErrorCodeDetails:
    def __init__(self):
        self.helperObj = helper.Helper()

    def getId(self):
        return self.id_

    def getErrorCode(self):
        return self.error_code

    def getErrorCodeDescription(self):
        return self.error_code_desc

    def getErrorCategory(self):
        return self.error_category

    def getCreatedAt(self):
        return created_at

    def getUpdatedAt(self):
        return updated_at

    def setId(self, id_):
        self.id_ = id_

    def setErrorCode(self, error_code):
        self.error_code = error_code

    def setErrorCodeDescription(self, error_code_desc):
        self.error_code_desc = error_code_desc

    def setErrorCategory(self, error_category):
        self.error_category = error_category

    def setCreatedAt(self, created_at):
        self.created_at = created_at

    def setUpdatedAt(self, updated_at):
        self.updated_at = updated_at

    def insert(self, val, conn_obj):
        mycursor = conn_obj.cursor()
        sql = "INSERT INTO error_code_details (error_code, error_code_description, error_category, created_at, updated_at) VALUES (%s, %s, %s, %s, %s)"
        current_Date = self.helperObj.getCurrentDateTime()
        val.append(current_Date)
        val.append(current_Date)
        mycursor.execute(sql, val)
        conn_obj.commit()
        return mycursor.lastrowid

    def select(self, val, conn_obj):
        val = val.strip()
        mycursor = conn_obj.cursor()
        sql = "SELECT id from error_code_details where error_code = '{}'".format(val)
        mycursor.execute(sql, val)
        record = mycursor.fetchall()
        if not record:
            return 50
        return record[0][0]
