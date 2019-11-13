# Built-in library imports
import os
import pwd
import shutil

# Custom library imports
import db as db
import DuplicateInfo as dInfo
import pylintApi as api
import logging

class Trigger:
    def replicateRepo(self, db_obj):
        res = db_obj.usersSelect()
        if res:
            user_name = res[0][1]
            email = res[0][2]
            activation_key = res[0][3]
            repository = res[0][4]
            path = ''
            return api.getFileNames(user_name, repository, path, True)
        else:
            return False

    def getFilesWithDir(self):
        file_dict = dict()
        dir_path = os.path.dirname(os.path.realpath(__file__))
        downloaded_data_path = dir_path + '/downloaded_data'
        for root, dirs, files in os.walk(downloaded_data_path, topdown=False):
            for name in files:
                if ".git" not in os.path.join(root, name):
                    if ".py" in os.path.join(root, name):
                        x = os.path.join(root, name).split("/")
                        fileName = x[len(x)-1]
                        filePath = os.path.abspath(os.path.dirname(fileName))
                        val = [fileName, "Python", filePath]
                        file_dict[fileName] = os.path.join(root, name)
        return file_dict



    def getFileMetrics(self, file_dict, db_conn):
        dir_path = os.path.dirname(os.path.realpath(__file__))
        results_file2_path = dir_path + '/results/file2.txt'
        for key, value in file_dict.items():
            api.runDupFile(value, results_file2_path)
            codePercent = api.getCodePercentage(results_file2_path)
            docPercentage = api.getDocStringPercentage(results_file2_path)
            commentPercentage = api.getCommentPercentage(results_file2_path)
            emptyPercentage = api.getEmptyPercentage(results_file2_path)
            list_val = [key, value]
            fileinfo_id = db_conn.fileInfoSelect(list_val)
            metric_list = [fileinfo_id, codePercent, docPercentage, commentPercentage, emptyPercentage]
            db_conn.fileMetricsInsert(metric_list)

    def getFileInfo(self, file_dict, db_conn):
        file_info_list = list()
        for key, value in file_dict.items():
            file_info_list.append(key)
            file_info_list.append("Python")
            file_info_list.append(value)
            db_conn.fileInfoInsert(file_info_list)
            file_info_list = list()
        return file_info_list

    def generateDuplicate(self, db_conn):
        # Create a repository dir.
        currentPath = os.path.abspath(os.path.dirname(__file__))
        repository_dir = currentPath + '/downloaded_data'
        result_dir = currentPath + '/results/'
        if os.path.exists(result_dir):
            shutil.rmtree(result_dir)

        os.mkdir(result_dir)
        #try:
        #    os.mkdir(result_dir)
        #    uid, gid =  pwd.getpwnam('root').pw_uid, pwd.getpwnam('www-data').pw_uid
        #    os.chown(result_dir, uid, gid)
        #except OSError as err:
        #    print ("Creation of the directory {} failed with message: {}".format(result_dir, err))
        #    exit()
        #else:
        #    print ("Successfully created the directory {} ".format(result_dir))

        duplicate_info_file_path = result_dir + 'duplicate_info.txt'
        logging.warning('Before rundup dup_file_path: {}'.format(duplicate_info_file_path))
        logging.warning('Before rundup repo_path: {}'.format(repository_dir))
        api.runDupRepo(duplicate_info_file_path, repository_dir)
        nDup = api.getNumberDuplication(duplicate_info_file_path)
        pDup = api.getPercentDuplication(duplicate_info_file_path)
        if nDup:
            numberDup = int(nDup)
        else:
            numberDup = 0
        if pDup:
            percentDup = float(pDup)
        else:
            percentDup = 0.0
        val = [numberDup, percentDup]
        db_conn.duplicateInfoDelete()
        dOut = db_conn.duplicateInfoInsert(val)
        return dOut


    def getErrorInfo(self, file_dict, db_conn):
        dir_path = os.path.dirname(os.path.realpath(__file__))
        results_file_path = dir_path + '/results/file.txt'
        for key, value in file_dict.items():
            api.runCREWFile(value, results_file_path)
            list_val = [key, value]
            fileinfo_id = db_conn.fileInfoSelect(list_val)
            conv_dict = api.getConventionDict(results_file_path)
            if conv_dict:
                for key, value in conv_dict.items():
                    key = key.lstrip()
                    e_id = db_conn.errorCodeDetailsSelect(key)
                    val_list = [e_id, fileinfo_id]
                    for i in range(value):
                        db_conn.errorInfoInsert(val_list)
                        val_list.clear()
                        val_list = [e_id, fileinfo_id]
            refactor_dict = api.getRefactorDict(results_file_path)
            if refactor_dict:
                for key, value in refactor_dict.items():
                    key = key.lstrip()
                    e_id = db_conn.errorCodeDetailsSelect(key)
                    val_list = [e_id, fileinfo_id]
                    for i in range(value):
                        db_conn.errorInfoInsert(val_list)
                        val_list.clear()
                        val_list = [e_id, fileinfo_id]
            error_dict = api.getErrorDict(results_file_path)
            if error_dict:
                for key, value in error_dict.items():
                    key = key.lstrip()
                    e_id = db_conn.errorCodeDetailsSelect(key)
                    val_list = [e_id, fileinfo_id]
                    for i in range(value):
                        db_conn.errorInfoInsert(val_list)
                        val_list.clear()
                        val_list = [e_id, fileinfo_id]
            warning_dict = api.getWarningDict(results_file_path)
            if warning_dict:
                for key, value in warning_dict.items():
                    key = key.lstrip()
                    e_id = db_conn.errorCodeDetailsSelect(key)
                    val_list = [e_id, fileinfo_id]
                    for i in range(value):
                        db_conn.errorInfoInsert(val_list)
                        val_list.clear()
                        val_list = [e_id, fileinfo_id]

def croncall():
    trigger_obj = Trigger()
    dir_path = os.path.dirname(os.path.realpath(__file__))
    app_logs = dir_path + '/app.log'
    logging.basicConfig(filename=app_logs, filemode='w', format='%(name)s - %(levelname)s - %(message)s')
    logging.warning('Logging Starts')
    db_conn = db.DatabaseOperation()
    db_conn.duplicateInfoDelete()
    db_conn.fileMetricsDelete()
    db_conn.errorInfoDelete()
    db_conn.fileInfoDelete()
    logging.warning('Data deleted')
    isRep = trigger_obj.replicateRepo(db_conn)
    logging.warning('Repo replicated')
    if isRep:
        file_dict = trigger_obj.getFilesWithDir()
        logging.warning('file_dict generated')
        file_name_list = list()
        for file_name in file_dict:
            file_name_list.append(file_name)
        trigger_obj.getFileInfo(file_dict, db_conn)
        logging.warning('past getFileInfo')
        trigger_obj.getFileMetrics(file_dict, db_conn)
        logging.warning('past getFileMetrics')
        trigger_obj.generateDuplicate(db_conn)
        logging.warning('past generateDuplicate')
        trigger_obj.getErrorInfo(file_dict, db_conn)
        logging.warning('past getErrorInfo')
    db_conn.db_conn_close()

if __name__ == '__main__':
    croncall()
