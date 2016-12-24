class NotesController < ApplicationController
  before_action :not_owner_redirect, only: :destroy

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id

    if @note.save
      redirect_to track_url(@note.track)
    else
      flash[:errors] = @note.errors.full_messages
      redirect_to track_url(@note.track)
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to track_url(@note.track)
  end

  private

  def note_params
    params.require(:note).permit(:body, :track_id)
  end

  def not_owner_redirect
    @note = Note.find(params[:id])
    redirect_to track_url(@note.track)
    render text: "403 FORBIDDEN"
  end
end
