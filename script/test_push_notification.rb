pusher = Grocer.pusher(
    certificate: "#{Rails.root}/config/certs/iclass_push_notification.pem",      # required
    passphrase:  "",                       # optional
    gateway:     "gateway.push.apple.com", # optional; See note below.
    port:        2195,                     # optional
    retries:     3                         # optional
)
notification = Grocer::Notification.new(
    device_token: "3b9dcd198c79c31f9f6165be31f948e60c495d03",
    alert:        "Hello from Grocer!",
    badge:        42,
    sound:        "siren.aiff",         # optional
    expiry:       Time.now + 60*60,     # optional; 0 is default, meaning the message is not stored
    identifier:   1234                  # optional
)

pusher.push(notification)
