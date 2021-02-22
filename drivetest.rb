require "google_drive"

# config.jsonを読み込んでセッションを確立
session = GoogleDrive::Session.from_config("config.json")

# スプレッドシートをURLで取得
ws = session.spreadsheet_by_url("https://docs.google.com/spreadsheets/d/1K2B3v0mslCPbF7YKb83RJ4fNqGNwTfT3q2MdibV_yMc/edit#gid=0").worksheets[0]

# セルを指定して値を更新　インデックスの基準は1
ws[2, 1] = "foo" # セルA2
ws[2, 2] = "bar" # セルB2

# saveで変更を保存、実際にスプレッドシートに反映させる
ws.save