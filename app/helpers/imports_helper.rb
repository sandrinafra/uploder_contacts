module ImportsHelper
  def xlsx_process
    xlsx = Roo::Spreadsheet.open(@import.file)
    xlsx.each_row_streaming(offset: 1) do |row|
      ct = Contact.new(firstname: row[0], lastname: row[1], email: row[2], import: @import)
      if ct.valid
        ct.status = "ok"
        ct.save
      end
    end
  end
end
