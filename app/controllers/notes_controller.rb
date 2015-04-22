class NotesController < ApplicationController
  def index
    @notes = Note.paginate(page: params[:page]).order('updated_at DESC')
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    if Note.create!(params[:note])
      redirect_to notes_path, flash: {notice: "Note created successfully."}
    else
      redirect_to new_note_path, flash: {alert: "Note was not created successfully. Please try again."}
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    if note = Note.find(params[:id])
      note.update(params[:note])
      flash[:notice] = "Note Updated Successfully"
      redirect_to notes_path
    else
      flash[:alert] = "There was a problem editing your note. Please try again"
      redirect_to :back
    end
  end

  def destroy
    if note = Note.find(params[:id])
      note.destroy
      redirect_to notes_path, flash: {notice: 'Note destroyed successfully.'}
    else
      redirect_to notes_path, flash: {alert: 'Note could not be found.'}
    end
  end
end
