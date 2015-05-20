class StateController < ApplicationController

	def filter
		filterString = params[:substring]
		filterString = "" if filterString == nil
		@filteredStates = State.getFilteredStates(filterString)
	end
end
