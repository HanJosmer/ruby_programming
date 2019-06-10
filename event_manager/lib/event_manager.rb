require "csv"
require 'google/apis/civicinfo_v2'
require 'erb'
require 'date'

def clean_zipcode zipcode
    # coercion over questions
    zipcode.to_s.rjust(5, "0")[0..4]

    # if zipcode.nil?
    #     zipcode = "00000"
    # elsif zipcode.length < 5
    #     zipcode = zipcode.rjust(5, "0")     
    # elsif zipcode.length > 5
    #     zipcode = zipcode[0..4]
    # else
    #     zipcode
    # end
end

def clean_phone_number phone_number
    phone_number = phone_number.scan(/\d+/).join("")

    if phone_number.nil?
        phone_number = "0000000000"
    elsif phone_number.length == 11
        if phone_number[0] == 1
            phone_number[1..10]
        else
            phone_number = "0000000000"
        end
    elsif phone_number.length > 11 || phone_number.length < 10
        phone_number = "0000000000"
    end

    return phone_number == "0000000000" ? "No phone number provided" : "#{phone_number[0..2]}-#{phone_number[3..5]}-#{phone_number[6..9]}"
end

def legislators_by_zipcode(zipcode)
    civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
    civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
    
    begin
        legislators = civic_info.representative_info_by_address(
                                    address: zipcode,
                                    levels: 'country',
                                    roles: ['legislatorUpperBody', 'legislatorLowerBody']
                                    ).officials
    rescue
        "You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials"
    end
end

def save_thank_you_letters(id, form_letter)
    Dir.mkdir("output") unless Dir.exists? "output"

    filename = "output/thanks_#{id}.html"
    
    File.open(filename, "w") do |file|
        file.puts form_letter
    end
end

def parse_reg_time reg_time
    date_time_array = reg_time.split(" ")
end

def registration_hours reg_date
    date_time_array = parse_reg_time(reg_date)
    time = DateTime.strptime(date_time_array[1], '%H:%M')
    hour = time.strftime('%H')
end

def registration_days reg_date
    date_time_array = parse_reg_time(reg_date)
    date = DateTime.strptime(date_time_array[0], '%m/%d/%y')
    day = date.wday
end

def most_frequent_registration_hour registration_hour, registration_hour_hash
    registration_hour_hash[registration_hour] += 1
end

def most_frequent_registration_days registration_day, registration_day_hash
    registration_day_hash[registration_day] += 1
end

puts "EventManager Initialized!"

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

registration_hour_list = Array.new
registration_hour_hash = Hash.new(0)

registration_day_list = Array.new
registration_day_hash = Hash.new(0)

contents.each do |row|
    id = row[0]
    name = row[:first_name]
    
    zipcode = clean_zipcode(row[:zipcode])

    phone_number = clean_phone_number(row[:homephone])

    # legislators = legislators_by_zipcode(zipcode)

    # form_letter = erb_template.result(binding)

    most_frequent_registration_hour(registration_hours(row[:regdate]), registration_hour_hash)
    
    most_frequent_registration_days(registration_days(row[:regdate]), registration_day_hash)

    # save_thank_you_letters(id, form_letter)
end

# puts registration_hour_hash
puts "The peak registration hours are " + (registration_hour_hash.select { |k, v| v == registration_hour_hash.values.max }).keys.join(" and ")
puts "The peak registration day is " + (registration_day_hash.select { |k, v| v == registration_day_hash.values.max }).keys.join(" and ")