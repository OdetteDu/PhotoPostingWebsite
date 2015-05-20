class TabsController < ApplicationController
	def show2
		@firstTabs = [{label:"Inventory", url:"inventories"}, 
				 {label:"Order Information", url:"orders"},
			 	 {label:"Accounts", url:"accounts"},
			 	 {label:"Shippers", url:"shippers"}, 
			 	 {label:"Suppliers", url:"suppliers"}]
		@firstSelected = "Accounts"
		@secondTabs = [{label:"First", url:"first"}, 
				 {label:"Second", url:"second"},
			 	 {label:"Third", url:"third"},
			 	 {label:"Fourth", url:"fourth"}, 
			 	 {label:"Fifth", url:"fifth"}]
		@secondSelected = "Second"
	end
end
