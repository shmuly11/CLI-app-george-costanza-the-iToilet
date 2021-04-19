# require 'catpix'
require "audio-playback"
# require "tco"
# require "rmagick"
require "colorize"
require 'pastel'
require 'tty-font'
require 'pry'

class Start

def play 
AudioPlayback.play("Seinfeld.wav")
end
#sleep(1.5)
# # Play in the foreground
# @playback.block
#.colorize(:color => :red)
pastel = Pastel.new

# puts "anywhere in the city"
# sleep(1)
def title
puts "
            ███╗   ███╗ █████╗  ██████╗ ███╗   ██╗██╗███████╗██╗ ██████╗███████╗███╗   ██╗████████╗
            ████╗ ████║██╔══██╗██╔════╝ ████╗  ██║██║██╔════╝██║██╔════╝██╔════╝████╗  ██║╚══██╔══╝
            ██╔████╔██║███████║██║  ███╗██╔██╗ ██║██║█████╗  ██║██║     █████╗  ██╔██╗ ██║   ██║   
            ██║╚██╔╝██║██╔══██║██║   ██║██║╚██╗██║██║██╔══╝  ██║██║     ██╔══╝  ██║╚██╗██║   ██║   
            ██║ ╚═╝ ██║██║  ██║╚██████╔╝██║ ╚████║██║██║     ██║╚██████╗███████╗██║ ╚████║   ██║   
            ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝ ╚═════╝╚══════╝╚═╝  ╚═══╝   ╚═╝   
                    ███████╗ █████╗  ██████╗██╗██╗     ██╗████████╗██╗███████╗███████╗██╗          
                    ██╔════╝██╔══██╗██╔════╝██║██║     ██║╚══██╔══╝██║██╔════╝██╔════╝██║          
                    █████╗  ███████║██║     ██║██║     ██║   ██║   ██║█████╗  ███████╗██║         
                    ██╔══╝  ██╔══██║██║     ██║██║     ██║   ██║   ██║██╔══╝  ╚════██║╚═╝          
                    ██║     ██║  ██║╚██████╗██║███████╗██║   ██║   ██║███████╗███████║██╗          
                    ╚═╝     ╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚═╝   ╚═╝   ╚═╝╚══════╝╚══════╝╚═╝".blue
            
end
 
 
 def pic
 puts "
                                            `..-:::/::-.`                                           
                                        .:oyhddddhhdddddhyo:.                                       
                                    `-+yhddhso+++//+++ooshddhy+:.`                                  
                                  -+hdmdhs+/::::::::::::://ohdmddhyo:`                              
                               `:sdmdmho/:::::::::::::::::::/sdmdddddh+`                            
                              `hdddddy/::::::::::::::::::::::/ohmdddddmy-                           
                             -ydddddo:::::::::::::::::::::::::/sdddddddmdy                          
                            :hdddddo:::::::::::::::::::::::::::+ymddddddmms                         
                           `hdddmdo::::::::::::::::::::::::::::/shmmdddddmd.                        
                           odddmdo/:::::::::::::::::::::::::::::+ydmmddddmmh                        
                          .dmmmds+/:::::::::::::::::::::::::::::/oydmdddmmmd`                       
                         `hmmmmy+++//:://////////::::::::::::::/++oydmmmmmmh                        
                          ymmmdo++++///////////////////////////++++ohmmmmmmy                        
                          ommmy++++++/////::::::::::::///////+++++++odmmmmm:                        
                         `oydds+oyyyyso+///////////////++++++////++++ymmmmh`                        
                         :oosdoossssyyhhy++++++++++oyhhhhhhhhs+++++++smmmdo.                        
                         `sshh+ssssyyhhyyy+++++++++syyyyysso+os++++++hmdyo+s.                       
                          ++dhyo//ysshhhyyyssssssyyysyyyyysyys++++syydmyhyoo-                       
                          `oyyy/::///++o+shs/::/hs+oyosdddossyysyysosmdhsy+s`                       
                          `oyyy/:::::///+dd+::::hdo/::/+++/::+hooo+/ymdy+yo/                        
                          :shyy+//:::://ods:::::ods/::::/::::+y//::/hyssoss                         
                          oosy+yso++++osyo:::::::yy++///:::/os/::::/++sooo-                         
                          -shy++/+oosssyo:::::::/oyyyssoossyo/::::/++++++o                          
                            .h++/::/+ooys+////oo+oyooooooo+/:::::/+++yoos-                          
                             ys+/::/+/:/oyssyyyyso/://+/::::::://++++s++.                           
                             oys+//+:::::/+++//:::::::/++//////+++++y.                              
                             -ho+/++::/+++///://///::::++++++++++++o+                               
                              +yo+++:://+ossssssssoo+/:/++++++++++so                                
                               /yo++/:::////++++///::::+++++++++sy+`                                
                                -yso+::::///++////::::/+++++++sys-                                  
                                 .syo/::::::::::::::::/++++osyo-                                    
                                  `oyo+/::::::::::::/++++oys+.                                      
                                    /ys++//:::::://+++oss+-`                                        
                                     -sssoo+++++oossss+-`                                           
                                       .:+oossoo+/:-`                                               
                                                       ".colorize(:black).on_cyan

 end
 
 def quote
    # line = ["anywhere", "in", "the", "city"]
    # #binding.pry
    # line.each do |w|
    #     system 'clear'
    #     pic(w)
    #     sleep(0.3)
    # end
    
    font = TTY::Font.new(:straight)
    puts font.write("                                     anywhere in the city")
    
 sleep(1.2)
#  system 'clear'
#  pic
#  puts font.write("anywhere in")
#  sleep(0.3)
#  system 'clear'
#  pic
#  puts font.write("anywhere in the")
#  sleep(0.2)
#  system 'clear'
#  pic
#  puts font.write("anywhere in the city")
#  sleep(0.1)

end

def quote_2
    font = TTY::Font.new(:straight)
 system 'clear'
 puts font.write("I'll")
 sleep(0.4)
 system 'clear'
 puts font.write("I'll tell")
 sleep(0.3)
 system 'clear'
 puts font.write("I'll tell you")
 sleep(0.2)
 system 'clear'
 puts font.write("I'll tell you the")
 sleep(0.1)
 system 'clear'
 puts font.write("I'll tell you the best")
 sleep(0.1)
 system 'clear'
 puts font.write("I'll tell you the best public")
 sleep(0.1)
 system 'clear'
 puts font.write("I'll tell you the best public toilet")
end
 
 #sleep(1.5)
# def mag
#  puts title
# end

 #sleep(3)

 def intro
    play
    pic
    sleep(1.5)
    quote
    sleep(0.3)
    quote_2
    sleep(1.5)
    title
    sleep(3)

 end

end