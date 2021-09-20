class Public::ChaptersController < ApplicationController
  before_action :set_subject, only: [:index]
  def index
    @textbook_lists = @subject.textbook_lists
    @section = Section.new
    # if params[:status].present?
    #   session[:status] = params[:status]
    #   @chapters = @chapters.where(status: session[:status])
    # else
    #   if session[:status].blank?
    #     @chapters = @chapters.where(status: 0)
    #   else
    #     @chapters = @chapters.where(status: session[:status])
    #   end
    # end
    # @chapters = Chapter.all
  end

  def subject
  end

  private

  def set_subject
    @subject = if params[:subject].present?
                 SubjectArea.find_by(name: params[:subject])
               else
                 SubjectArea.find_by(name: '算数')
               end
    textbook_list = if params[:textbook].present?
                      @subject.textbook_lists.find_by(title: params[:textbook])
                    else
                      @subject.textbook_lists.find_by(title: 'デフォルト')
                    end
    @chapters = textbook_list.chapters.includes(:sections)
  end
end
