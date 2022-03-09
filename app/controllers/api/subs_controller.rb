class Api::SubsController < ApplicationController
#Traffic directors, it will need to model/database or will return data
#Only actions
#actions = functionatily you are doing in the back end, CRUD actions
#Skinny controllers / Fat models, so all logic with sub class as a model
# all CRUD actoins and other actions, they be in controller
# a controller action is represented by a method
#return a HTMl, XML, JSON or redirect action
#JSON - js onjext notation, rails and react understand
#callbacks = trigger based off of a before or after a action is called
#before_action(most used)
#after_action
#skip_before_action
#skip_before_action

]#EXAMPLE:
# #before_action :verify_user

# def :verify_user
#   #make sure they are logged in
#all controllers inherit the applicatin controller
#anything with all controllers would be put in application controller
#ACTIONS:
#index -> see all of the items
#show, needs an id, show a single item
#create, data of the fields, and create an item, only works if it pass the params and model validations
#update, need an id, and fields that are changing, update an item
#destroy, need an id, delete an item

#pattern to follow to fill out the controller
#follow the patter. Replace model name with model
#and follow casing and plural
# before_action :set_model_name, only: [:show, :update, :destroy]

# def index
#   @model_name = Model_name.all
#   render json: @model_names


# end

# def show
#   @model_name = Model_name.find(params[:id])
#   redner json: @model_name

# end

# def create
#   @model_name = Model_name.new(model_name_params)
#   if @model_name.save
#     render json: @model_name
#   else
# render json: { errors: @model_name.errors }, staus: :unprocessable_entity
#   end
# end

# def update
#   @model_name = Model_name.find(params[:id])
#   if @model_name.update(model_name_params)
#     render json: @model_name
#   else render json: { errors: @model_name.errors }, staus: :unprocessable_entity
# end
# end

# def destroy
#   @model_name = Model_name.find(params[:id])
#   @model_name.destroy
#   render json: { message: 'Model_name'}

# end

# private # only run in the class
# def model_name_params
#   params.require(:model_name).permit(:attr, :attr2)
# end

# def set_model_name
#   @model_name = Model_name.find(params[:id])

# end

#model name -> Sub
before_action :set_sub, only: [:show, :update, :destroy]
def index
render json: Sub.all
end

def show
@sub = Sub.find(params[:id])
render json: @sub
end

def create
@sub = Sub.new(sub_params)
if @sub.save
  render json: @sub
else
  render josn: { errors: @sub.errors }, staus: :unprocessable_entity
end
end

def update
@sub = Sub.find(params[:id])
if @sub.update(sub_params)
  render json: @sub
else render josn: { errors: @sub.errors }, staus: :unprocessable_entity
end
end

def destroy
  @sub = Sub.find(params[:id])
  @sub.destroy
  render json: { message: 'Sub delete' }

end

private 
# make sure we are passing the right fields
# { sub: { title: 'travel' } }
def sub_params
params.require(:sub).permit(:title)
end

def set_sub
  @sub = Sub.find(params[:id])
end


end
