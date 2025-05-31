class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.search(params = {})
  data = params[:data] || all.select(column_names.map{|c| "#{table_name}.\"#{c}\"" if !["created_at","updated_at"].include?(c)}.compact.join(","))
  # get total data (before limit,offset)
  total_query = data
  total_query = total_query.except(:select).select("COUNT(*) as total")
  total_sql = total_query.to_sql

  order = params[:order]
  offset = params[:offset].to_i
  limit = params[:limit].to_i
  page = params[:page].to_i
  offset = (page - 1) * limit if page > 0

  data = data.order(order)
  
# data=data.where("case_types.id=#{params[:case_type_id]}") if params[:case_type_id].present?
  data = data.offset(offset) if offset
  data = data.limit(limit) if limit > 0

  if params[:datatable]
    total = connection.execute total_sql
    if total.any?
      total_record = total[0]["total"].to_i
      total_page = limit == 0 ? 1 : (total_record.to_f / limit).ceil
      page = limit == 0 ? 1 : 1 + (offset / limit)

      results = {
        data: results.to_a,
        total: total_record,
        total_page: total_page,
        page: page,
        limit: limit,
        offset: offset,
      }
    else
      results = {
        data: [],
        total: 0,
        total_page: 0,
        page: 0,
        limit: limit,
        offset: offset,
      }
    end
  end
  results
end
end
