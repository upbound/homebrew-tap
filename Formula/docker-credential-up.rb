# frozen_string_literal: true

# Copyright 2022 Upbound Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class DockerCredentialUp < Formula
  desc 'Upbound Docker credential helper'
  homepage 'https://upbound.io'
  version 'v0.56.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.56.0/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 '3cc94655a0fc45cad86d344eaf2d611620a85f41f031c90fed3f09e2be0e33f3'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.56.0/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 '41f18a80b8fdf181ec2e112a9807897058369f7e88e2be125d744d354cb663cf'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.56.0/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 'ceeda2ae0777d6f9b5dc993fdd3c49a8afe0ad6a5db09af5030b53c0aecf6d9c'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.56.0/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 'f7d543101fd1ce2746a902d936abb0ee3505b1032fb71f967bdd0e5aff41db87'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
