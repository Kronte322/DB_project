import os

import psycopg2

import SQLScripts


class DBConnection:
    def __init__(self):
        try:
            self.connection = psycopg2.connect(f"""
        dbname='{os.getenv("DBNAME")}' 
        user='{os.getenv("DBUSER")}' 
        host='{os.getenv("DBHOST")}' 
        port='{os.getenv("DBPORT")}' 
        password='{os.getenv("DBPASSWORD")}'
    """
                                               )
        except Exception:
            raise 'Connection Failed!!!'
        self.cursor = self.connection.cursor()

    def Close(self):
        self.connection.commit()
        self.cursor.close()
        self.connection.close()

    def ExecuteScript(self, script):
        self.cursor.execute(script)
        self.connection.commit()
        return self.cursor.fetchall()

    def GetActiveServers(self):
        self.cursor.execute(SQLScripts.GET_ACTIVE_SERVERS_SQL_SCRIPT)
        return self.cursor.fetchall()

    def GetAllServers(self):
        self.cursor.execute(SQLScripts.GET_ALL_SERVERS_SQL_SCRIPT)
        return self.cursor.fetchall()

    def GetRanks(self):
        self.cursor.execute(SQLScripts.GET_ALL_RANKS_SQL_SCRIPT)
        return self.cursor.fetchall()

    def SetServerOnline(self, server_id):
        self.cursor.execute(SQLScripts.SET_SERVER_ONLINE(server_id))
        self.connection.commit()

    def SetServerOffline(self, server_id):
        self.cursor.execute(SQLScripts.SET_SERVER_OFFLINE(server_id))
        self.connection.commit()

    def GetServerId(self, ip_address, port):
        self.cursor.execute(SQLScripts.GET_SERVER_ID(ip_address, port))
        return self.cursor.fetchall()[0][0]

    def SetGameToOnlineServer(self, ip_address, port, game_id):
        self.cursor.execute(SQLScripts.SET_GAME_TO_ONLINE_SERVER(ip_address, port, game_id))
        self.connection.commit()

    def GetOfflineServersWithIp(self, ip_address):
        self.cursor.execute(SQLScripts.GET_OFFLINE_SERVER_WITH_IP(ip_address))
        return self.cursor.fetchall()

    def GetAddressesOfOfflineServers(self):
        self.cursor.execute(SQLScripts.GET_ADDRESSES_OF_OFFLINE_SERVERS)
        return self.cursor.fetchall()

    def SetActivePlayersOnServer(self, ip_address, port, num_of_players):
        self.cursor.execute(SQLScripts.SET_ACTiVE_PLAYERS_ON_SERVER(ip_address, port, num_of_players))
        self.connection.commit()

    def GetUserId(self, user_nm, user_password):
        self.cursor.execute(SQLScripts.GET_USER_ID(user_nm, user_password))
        return self.cursor.fetchall()[0][0]

    def AddNewUser(self, user_nm, user_password, country_name, city_name):
        self.cursor.execute(SQLScripts.ADD_NEW_USER(user_nm, user_password, country_name, city_name))
        self.connection.commit()

    def AddNewPlayer(self, user_id, nick_name):
        self.cursor.execute(SQLScripts.ADD_NEW_PLAYER(user_id, nick_name))
        self.connection.commit()

    def AddNewServer(self, ip_address, port, country, max_players):
        self.cursor.execute(SQLScripts.ADD_NEW_SERVER(ip_address, port, country, max_players))
        self.connection.commit()

    def GetUserNickName(self, user_id):
        self.cursor.execute(SQLScripts.GET_NICKNAME(user_id))
        return self.cursor.fetchall()[0][0]
