class Public::ChaptersController < ApplicationController
  before_action :set_subject, only: [:index]
  def index
    if params[:status].present?
      session[:status] = params[:status]
      @chapters = @chapters.where(status: session[:status])
    else
      if session[:status].blank?
        @chapters = @chapters.where(status: 0)
      else
        @chapters = @chapters.where(status: session[:status])
      end
    end

  end
  def subject
  end

  private

  def set_subject
    if params[:subject] == 'math'
      @chapters = Chapter.where(subject: 'math').order(:subject, :grade)
    elsif params[:subject] == 'science'
      @chapters = Chapter.where(subject: 'science').order(:subject, :grade)
    elsif params[:subject] == 'japanese'
      @chapters = Chapter.where(subject: 'japanese').order(:subject, :grade)
    elsif params[:subject] == 'society'
      @chapters = Chapter.where(subject: 'society').order(:subject, :grade)
    elsif params[:subject] == 'english'
      @chapters = Chapter.where(subject: 'english').order(:subject, :grade)
    else
      @chapters = Chapter.order(:subject, :grade)
    end
  end
end
