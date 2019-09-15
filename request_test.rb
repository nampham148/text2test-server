require 'net/http'

uri = URI('https://1jwjnlh7r4.execute-api.us-east-2.amazonaws.com/prod/text2test')
res = Net::HTTP.post_form(uri, {"inputTranscript" => "Operation Paravane was a British air raid of World War II on the German battleship Tirpitz. The attack on 15 September 1944 by 21 Royal Air Force heavy bombers did irreparable damage, rendering the ship unfit for combat. A series of raids conducted from April to August by Royal Navy aircraft carriers had sought unsuccessfully to sink or disable the battleship at her anchorage in Kaafjord in the far north of German-occupied Norway, encountering formidable German defences. In September, Avro Lancaster bombers from two elite squadrons of RAF Bomber Command, flying from an airfield in the Soviet Union, attacked using heavy bombs and air-dropped mines. All of the British aircraft returned to base."})
puts res.body
