variable project_name{
    description="Name of the project"
    type=string
}

variable project_id{
    description="Identifier of the project"
    type=string
}

variable billing_account{
    description="Billing account identifier of the project"
    type=string
}

variable "region"{
    description="Region of our resources to deploy"
    type=string
    default="europe-west9"
}

variable "zone"{
    description="Zone of our resources to deploy"
    type=string
    default="europe-west9-a"
}