import subprocess
import csv
import json

result = subprocess.run(["aws", "ec2", "describe-instances", "--output", "json"], capture_output=True)
instance_data = json.loads(result.stdout)

with open("instance_metadata.csv", "w") as file:
    csv_writer = csv.writer(file)
    csv_writer.writerow(["Instance ID", "Instance Type", "Launch Time", "Private IP", "Public IP"])
    for reservation in instance_data["Reservations"]:
        for instance in reservation["Instances"]:
            csv_writer.writerow([instance["InstanceId"], instance["InstanceType"], instance["LaunchTime"], instance["PrivateIpAddress"], instance.get("PublicIpAddress", "")])
