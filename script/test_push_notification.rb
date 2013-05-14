pusher = Grocer.pusher(
    certificate: "#{Rails.root}/config/certs/certificate.pem",      # required
    passphrase:  "",                       # optional
    gateway:     "gateway.push.apple.com", # optional; See note below.
    #gateway:     "gateway.sandbox.push.apple.com.", # optional; See note below.
    #port:        2195,                     # optional
    retries:     3                         # optional
)
notification = Grocer::Notification.new(
    device_token: "790dfc8982e59f7936db182c2ccda5d3707d5034c7dac8e001bfae5bc73403fd",
    alert:        "Hello from Grocer!",
    badge:        42,
    #sound:        "siren.aiff",         # optional
    #expiry:       Time.now + 60*60,     # optional; 0 is default, meaning the message is not stored
    #identifier:   1234                  # optional
)

pusher.push(notification)
