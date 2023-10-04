class MedicineApi
	BASE_URL = "https://api.endlessmedical.com/v1/dx/"

	def self.init
		response = RestClient.get(BASE_URL+"InitSession")
		sessionID = JSON.parse(response.body)["SessionID"]
		Rails.logger.info(sessionID)
		Rails.logger.info(BASE_URL+"AcceptTermsOfUse?SessionID=" + sessionID + "&passphrase=I%20have%20read%2C%20understood%20and%20I%20accept%20and%20agree%20to%20comply%20with%20the%20Terms%20of%20Use%20of%20EndlessMedicalAPI%20and%20Endless%20Medical%20services.%20The%20Terms%20of%20Use%20are%20available%20on%20endlessmedical.com")
		new_response = RestClient.post(BASE_URL+"AcceptTermsOfUse?SessionID=" + sessionID + "&passphrase=I%20have%20read%2C%20understood%20and%20I%20accept%20and%20agree%20to%20comply%20with%20the%20Terms%20of%20Use%20of%20EndlessMedicalAPI%20and%20Endless%20Medical%20services.%20The%20Terms%20of%20Use%20are%20available%20on%20endlessmedical.com", 
			{}, content_type: :json, accept: :json)
		status = JSON.parse(new_response.body)["status"]
		Rails.logger.info(status)
		response = RestClient.get(BASE_URL+"GetFeatures")
		Rails.logger.info(response)
		array = JSON.parse(response.body)["data"]
		res = ""
		array.each do |val|
			res += val + " "
		end
		res	
	end        

end
