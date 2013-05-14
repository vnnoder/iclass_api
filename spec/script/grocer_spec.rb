require 'grocer'
require 'timeout'

describe "apple push notifications" do
  before do
    @server = Grocer.server(port: 2195)
    @server.accept # starts listening in background
  end

  after do
    @server.close
  end

  specify "As a user, I receive notifications on my phone when awesome things happen" do
    do_push_notification

    Timeout.timeout(3) {
      notification = @server.notifications.pop # blocking
      expect(notification.alert).to eq("Hello from Grocer!")
    }
  end

  def do_push_notification
    pusher = Grocer.pusher(
        certificate: "config/certs/certificate.pem",      # required
        passphrase:  "",                       # optional
        #gateway: "localhost",
        #gateway:     "gateway.push.apple.com", # optional; See note below.
        gateway:     "gateway.sandbox.push.apple.com.", # optional; See note below.
        port:        2195,                     # optional
        retries:     3                         # optional
    )
    notification = Grocer::Notification.new(
        device_token: "790dfc8982e59f7936db182c2ccda5d3707d5034c7dac8e001bfae5bc73403fd",
        alert:        "Hello from Grocer!",
        badge:        42,
    #sound:        "siren.aiff",         # optional
        expiry:       Time.now + 60*60,     # optional; 0 is default, meaning the message is not stored
        identifier:   1234                  # optional
    )

    pusher.push(notification)

  end
end
