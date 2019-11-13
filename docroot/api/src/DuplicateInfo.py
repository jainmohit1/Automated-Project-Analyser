import Helper as helper

class DuplicateInfo:
    # def __init__(self, id_, numberDuplicates, percentDuplication, created_at, updated_at):
    #     self.id_ = id_
    #     self.numberDuplicates = numberDuplicates
    #     self.percentDuplication = percentDuplication
    #     self.created_at = created_at
    #     self.updated_at = updated_at
    def __init__(self):
        helperObj = helper.Helper()

    def getId(self):
        return self.id_

    def getNumberDuplicates(self):
        return self.numberDuplicates

    def getPercentDuplicates(self):
        return self.percentDuplication

    def getCreatedAt(self):
        return created_at

    def getUpdatedAt(self):
        return updated_at

    def setId(self, id_):
        self.id_ = id_

    def setNumberDuplicates(self, numberDuplicates):
        self.numberDuplicates = numberDuplicates

    def setPercentDuplicates(self, percentDuplication):
        self.percentDuplication = percentDuplication

    def setCreatedAt(self, created_at):
        self.created_at = created_at

    def setUpdatedAt(self, updated_at):
        self.updated_at = updated_at

    def insert(self, val, conn_obj):
        mycursor = conn_obj.cursor()
        sql = "INSERT INTO duplicate_info (number_of_duplicate_lines, percentage_of_duplicate_lines,created_at,updated_at) VALUES (%s, %s, %s, %s)"
        current_Date = helperObj.getCurrentDateTime()
        val.append(current_Date)
        val.append(current_Date)
        mycursor.execute(sql, val)
        conn_obj.commit()
        return mycursor.lastrowid

    def delete(self, conn_obj):
        mycursor = conn_obj.cursor()
        sql = "DELETE FROM duplicate_info WHERE id > 0"
        mycursor.execute(sql, val)
        conn_obj.commit()
