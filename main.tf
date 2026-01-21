


resource "null_resource" "previous" {}

resource "time_sleep" "wait_in_seconds" {
  depends_on = [null_resource.previous]

  create_duration = "300s"
}

# This resource will create (at least) 900 seconds after null_resource.previous
resource "null_resource" "next" {
  depends_on = [time_sleep.wait_in_seconds]
}
