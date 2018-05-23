window.onload =->
  if document.querySelector('.table-container') != null
    App.requests = App.cable.subscriptions.create {channel: "RequestsChannel", trap_id: window.location.href.split('/')[3]},
    connected: ->
    disconnected: ->
  # Called when the subscription has been terminated by the server

    received: (data) ->
      document.querySelector('table .row-header').insertAdjacentHTML('afterEnd',data)
      if document.querySelector('h3.not-found') !=null
        document.querySelector('h3.not-found').remove()

      update: ->
      @perform 'update'


