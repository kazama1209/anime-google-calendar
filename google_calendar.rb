require "bundler/setup"
require "google/apis/calendar_v3"
require "googleauth"
require "dotenv"
require "rexml/document"
require "open-uri"

Dotenv.load

APPLICATION_NAME = "Google Calendar".freeze # そこまで重要ではないので適当な名前でOK
CREDENTIALS_PATH = "./credentials.json".freeze # サービスアカウント作成時にDLしたJSONファイルをリネームしてルートディレクトリに配置
CALENDER_ID = ENV["CALENDER_ID"].freeze # Googleカレンダー設定ページの「カレンダーの統合」という項目内に記載されている値

class GoogleCalendar
  def initialize
    @service = Google::Apis::CalendarV3::CalendarService.new
    @service.client_options.application_name = APPLICATION_NAME
    @service.authorization = authorize
    @calendar_id = CALENDER_ID
  end

  # 認証
  def authorize
    authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open(CREDENTIALS_PATH),
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR_EVENTS
    )
    authorizer.fetch_access_token!
    authorizer
  end

  # カレンダーに予定を追加する
  def insert_event(summary, description, location, start_time, end_time)
    event = Google::Apis::CalendarV3::Event.new({
      summary: summary,         # タイトル
      description: description, # サブタイトル
      location: location,       # チャンネル名
      start: {
        date_time: start_time,  # 開始時刻
        time_zone: "Asia/Tokyo"
      },
      end: {
        date_time: end_time,    # 終了時刻
        time_zone: "Asia/Tokyo"
      }
    })

    @service.insert_event(@calendar_id, event)
  end
end
