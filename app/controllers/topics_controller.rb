# -*- coding: utf-8 -*-
class TopicsController < AbstractAppController
  def show
    @topic = Topic.published.find(params[:id])
  end

  def information
    @information = Topic.information.page(params[:page])
  end
end

