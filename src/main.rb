class UserManager
    attr_accessor :users

    def initialize()
        @users = []
    end

    class User
        attr_accessor :nick, :bio, :reg_date, :vip
    
        def initialize(nick, bio, id)
            @nick = nick[0..16]
            @bio = bio
            @id = id.to_s[0..5]
            @reg_date = Time.now.to_s
            @vip = false
        end
    
        def get_info()
            return [
                @nick,
                @id,
                @bio,
                @reg_date,
                @vip
            ]
        end
        
        def change_nick(new_nick)
            if new_nick.to_s && new_nick.to_s != ""
                @nick = new_nick.to_s[0..16]
            end
        end

        def change_id(new_id)
            if new_id.to_s && new_id.to_s != ""
                @id = new_id.to_s[0..5]
            end
        end

        def change_bio(new_bio)
            if new_bio.to_s && new_bio.to_s != ""
                @bio = new_bio.to_s
            end
        end

        def change_vip_status(bool)
            if bool == true || bool == false
                @vip = bool
            end
        end
    end

    def add_user(nick, bio = "No bio")
        @users << User.new(nick.to_s, bio.to_s, @users.length)
    end

    def show_users()
        @users.each { |user|
            user_attrbs = user.get_info
            if user_attrbs[4]
                puts("\n-+- User -+-\n" +
                    "#{user_attrbs[0]}##{user_attrbs[1]}\n" +
                    "\"#{user_attrbs[2]}\"\n" +
                    "joined #{user_attrbs[3]}"
                )
            else
                puts("\n--- User ---\n" +
                    "#{user_attrbs[0]}##{user_attrbs[1]}\n" +
                    "\"#{user_attrbs[2]}\"\n" +
                    "joined #{user_attrbs[3]}"
                )
            end
        }
    end

    def manage_user(id)
        user = @users[id.to_i]
        user_attrbs = user.get_info
        puts "what you will do with #{user_attrbs[0]}##{user_attrbs[1]}?\n1 - change user nick\n2 - change user bio\n3 - change user id (only for vip users)\n4 - change vip status"
        answer = gets.chomp
        if answer.to_i == 1
            puts "enter new nick"
            new_nick = gets.chomp
            user.change_nick new_nick
        end

        if answer.to_i == 2
            puts "enter new bio"
            new_bio = gets.chomp
            user.change_bio new_bio
        end

        if answer.to_i == 3 && user_attrbs[4]
            puts "enter new id"
            new_id = gets.chomp
            user.change_id new_id
        end

        if answer.to_i == 4
            puts "do you want enable vip status for #{user_attrbs[0]}##{user_attrbs[1]}? (y/n)"
            answr = gets.chomp
            if answr.downcase == "y" || answr.downcase == "yes"
                user.change_vip_status true
            else
                user.change_vip_status false
            end
        end
    end
end
