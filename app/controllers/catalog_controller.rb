class CatalogController < ApplicationController
  before_filter :initialize_cart
  # GET /catalogs
  # GET /catalogs.json
  def index
    @page_title = "Book List"
    @books = Book.paginate(:page => params[:page],
      :order => "books.id desc",
      :include => [:authors, :publisher], :per_page => 10)
  end

  # GET /catalogs/1
  # GET /catalogs/1.json
  def show
    @book = Book.find(params[:id]) rescue nil
    return render(:text => "Not found", :status => 404) unless @book
    @page_title = @book.title
  end

  # GET /catalogs/new
  def new
    @catalog = Catalog.new
  end

  # GET /catalogs/1/edit
  def edit
  end

  # POST /catalogs
  # POST /catalogs.json
  def create
    @catalog = Catalog.new(catalog_params)

    respond_to do |format|
      if @catalog.save
        format.html { redirect_to @catalog, notice: 'Catalog was successfully created.' }
        format.json { render action: 'show', status: :created, location: @catalog }
      else
        format.html { render action: 'new' }
        format.json { render json: @catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catalogs/1
  # PATCH/PUT /catalogs/1.json
  def update
    respond_to do |format|
      if @catalog.update(catalog_params)
        format.html { redirect_to @catalog, notice: 'Catalog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catalogs/1
  # DELETE /catalogs/1.json
  def destroy
    @catalog.destroy
    respond_to do |format|
      format.html { redirect_to catalogs_url }
      format.json { head :no_content }
    end
  end
  def latest
@page_title = "Latest Books"
@books = Book.latest
  end
end
