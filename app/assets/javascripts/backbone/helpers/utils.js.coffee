class Kandan.Helpers.Utils
  @unreadActivities = 0
  @unreadActivitiesTab =(0 for i in [10..1])

  @browserTabFocused: true

  @notifyInTitle: ()->
    @unreadActivities += 1
    $(document).attr('title', "(#{@unreadActivities}) Kandan")

  @notifyInTab: (channel_id)->
    @unreadActivitiesTab[Number(channel_id)] += 1
    channel_num = Number(channel_id)
    unreadActivitiesNum = @unreadActivitiesTab[channel_num]
    tabName = $(".tab_value-#{channel_id}").text()
    $(".tab_value-#{channel_id}").text(tabName.split(":")[0] + ":#{unreadActivitiesNum}")
 
  @months: [
    "January"
    ,"February"
    ,"March"
    ,"April"
    ,"May"
    ,"June"
    ,"July"
    ,"August"
    ,"September"
    ,"October"
    ,"November"
    ,"December"
  ]

  @resetUnreadActivities: () ->
    @unreadActivities = 0

  @resetUnreadActivitiesTab: (channel_id) ->
    @unreadActivitiesTab[Number(channel_id)] = 0
    tabName = $(".tab_value-#{channel_id}").text()
    $(".tab_value-#{channel_id}").text(tabName.split(":")[0])

  @unescape: (string) ->
    string.replace(/&#x2F;/g, "/")
