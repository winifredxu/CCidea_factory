class IdeasController < ApplicationController
	before_action :find_idea, only: [:edit, :update, :show, :destroy]

	def new
		@idea = Idea.new
	end

	def create
		@idea = Idea.new idea_params
		if @idea.save
			redirect_to @idea, notice: "Idea created successfully"
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @idea.update idea_params
			redirect_to @idea, notice: "Idea updated successfully"
		else
			render :edit
		end
	end

	def index
		@entire_ideas = Idea.all.order('title ASC')
	end

	def show
	end

	def destroy
		@idea.destroy
		redirect_to ideas_path, notice: "Idea deleted successfully"
	end

	private 

	def find_idea
		@idea = Idea.find(params[:id])
	end

	def idea_params
		params.require(:idea).permit(:title,:body)
	end
end
