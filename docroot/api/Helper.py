from datetime import datetime

class Helper:
    def getCurrentDateTime(self):
        self.current_Date = datetime.now()
        formatted_date = self.current_Date.strftime('%Y-%m-%d %H:%M:%S')
        return self.current_Date
