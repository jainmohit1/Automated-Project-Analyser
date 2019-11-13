# Built-in library imports
import mysql.connector

# Custom library imports
import DuplicateInfo as dInfo
import ErrorInfo as errorInfo
import FileInfo as fileInfo
import ErrorCodeDetails as errorCodeInfo
import FileMetrics as fileMetrics
import Users as users

class DatabaseOperation:
    conn_obj = ""

    def __init__(self):
        cnx = mysql.connector.connect(user='root', password='SE_CSC_510_ama',
                              host='206.189.202.188',
                              database='csc_se')
        self.conn_obj = cnx


    # def createDBEntry(self, Type):
    # 	#Based on the type, create entry in the DB table
    # 	#Type : DuplicateInfo, ErrorCodeDetails, ErrorInfo, FileInfo, FileMetrics tabels
    # 	#Appropiately call the setter methods and create the class object

    # 	if(Type == "DuplicateInfo"):
    #         api.runDupRepo()
    #         nDup = api.getNumberDuplication("file2.txt")
    #         pDup = api.getPercentDuplication("file2.txt")
    #         numberDup = int(nDup)
    #         percentDup = float(pDup)
    #         val = [numberDup, percentDup]
    #         dinf = dInfo.DuplicateInfo()
    #         dinf.insert(val, self.conn_obj)
    #         #sql = "INSERT INTO duplicate_info (name, address, ) VALUES (%s, %s, %s, %s)"
    #         #val = (numberDup, percentDup)

    #         #my_cursor.execute(sql, val)
    #         #mydb.commit()

    def duplicateInfoInsert(self,val):
        return dInfo.DuplicateInfo().insert(val, self.conn_obj)

    def duplicateInfoDelete(self):
        dInfo.DuplicateInfo().delete(self.conn_obj)

    def errorInfoInsert(self,val):
        res = errorInfo.ErrorInfo().insert(val, self.conn_obj)
        return res

    def errorInfoDelete(self):
        errorInfo.ErrorInfo().delete(self.conn_obj)

    def errorCodeDetailsSelect(self,val):
        res = errorCodeInfo.ErrorCodeDetails().select(val, self.conn_obj)
        return res

    def errorCodeDetailsInsert(self,val):
        res = errorCodeInfo.ErrorCodeDetails().insert(val, self.conn_obj)
        return res

    def fileInfoInsert(self,val):
        res = fileInfo.FileInfo().insert(val, self.conn_obj)
        return res

    def fileInfoDelete(self):
        fileInfo.FileInfo().delete(self.conn_obj)

    def fileInfoSelect(self,val):
        res = fileInfo.FileInfo().select(val, self.conn_obj)
        return res

    def fileMetricsInsert(self,val):
        res = fileMetrics.FileMetrics().insert(val, self.conn_obj)
        return res

    def fileMetricsDelete(self):
        fileMetrics.FileMetrics().delete(self.conn_obj)

    def usersInsert(self,val):
        res = users.Users().insert(val, self.conn_obj)
        return res

    def usersDelete(self):
        users.Users().delete(self.conn_obj)

    def usersSelect(self):
        res = users.Users().select(self.conn_obj)
        return res

    def db_conn_close(self):
        self.conn_obj.close()


