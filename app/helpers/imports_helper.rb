module ImportsHelper
  def xlsx_process
    xlsx = Roo::Spreadsheet.open(@import.file)
    xlsx.each_row_streaming(offset: 1) do |row|

      firstname = row[0].value.gsub("$^&", "é") if row[0].value
      firstname = firstname.capitalize if firstname
      firstname = "" if firstname && firstname.length < 3
      lastname = row[1].value.gsub("$^&", "é") if row[1].value
      lastname = lastname.capitalize if lastname
      lastname = "" if lastname && lastname.length < 3
      email = row[2].value.downcase if row[2].value
      ct = Contact.new(firstname: firstname, lastname: lastname, email: email, import: @import)

      if ct.valid?
        ct.save
      else
        ct_null = NullContact.new(firstname: row[0].value, lastname: row[1].value, email: row[2].value, status: "", import: @import)
        ct.errors.each do |attr, msg|
          ct_null.status += "#{attr} #{msg}|"
        end
        ct_null.status = ct_null.status[0...-1]
        ct_null.save
      end
    end
  end
end
