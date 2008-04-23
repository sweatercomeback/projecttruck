
class RecordFinder

  attr_reader :parameters
  attr :order_by, true

  def initialize (bool_mode = 'AND')
    @bool_mode = bool_mode
    @sqls = []
    @parameters = []
    @includes = []
    @order_by = ""
  end

  def add (sql, *params)
    @sqls << sql
    @parameters += params
  end

  def add_ref(field, int)
    add "#{field.to_s} = ?", int
  end

  def add_wildcard(field, value)
    add "#{field.to_s} LIKE ?", "%#{value}%"
  end

  def add_finder(finder)
    @sqls << finder.sql_string
    @parameters += finder.parameters
  end

  def sql_string
    @sqls.collect{|sql| "(#{sql})"}.join(" #{@bool_mode} ")
  end

  def to_conditions
    if @sqls.length > 0
      [ sql_string ] + @parameters
    else
      nil
    end
  end

  def to_find_options
    {
      :include => @includes,
      :conditions => to_conditions,
      :order => @order_by
    }
  end

  def include(path)
    unless @includes.include? path
      @includes << path
    end
  end
end

