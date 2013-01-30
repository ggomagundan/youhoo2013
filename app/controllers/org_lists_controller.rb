class OrgListsController < ApplicationController

  before_filter :is_admin, only: [:new, :edit, :create, :update, :destroy]
  
  # GET /org_lists
  # GET /org_lists.json
  def index
    @org_lists = OrgList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @org_lists }
    end
  end

  # GET /org_lists/1
  # GET /org_lists/1.json
  def show
    @org_list = OrgList.find(params[:id])
    @org_list.views+=1
    @org_list.save
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @org_list }
    end
  end

  # GET /org_lists/new
  # GET /org_lists/new.json
  def new
    @org_list = OrgList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @org_list }
    end
  end

  # GET /org_lists/1/edit
  def edit
    @org_list = OrgList.find(params[:id])
  end

  # POST /org_lists
  # POST /org_lists.json
  def create
    @org_list = OrgList.new(params[:org_list])
    @org_list.views =0
    respond_to do |format|
      if @org_list.save
        format.html { redirect_to org_lists_path, notice: 'Org list was successfully created.' }
        format.json { render json: @org_list, status: :created, location: @org_list }
      else
        format.html { render action: "new" }
        format.json { render json: @org_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /org_lists/1
  # PUT /org_lists/1.json
  def update
    @org_list = OrgList.find(params[:id])

    respond_to do |format|
      if @org_list.update_attributes(params[:org_list])
        format.html { redirect_to org_lists_path, notice: 'Org list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @org_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /org_lists/1
  # DELETE /org_lists/1.json
  def destroy
    @org_list = OrgList.find(params[:id])
    @org_list.destroy

    respond_to do |format|
      format.html { redirect_to org_lists_url }
      format.json { head :no_content }
    end
  end

private 
  def is_admin
    if !current_user || current_user.uid!='100001720088532' 
	redirect_to signadmin_path
    end 

  end
end
