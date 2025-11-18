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
  version 'v0.42.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.42.1/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 'dd35bafe3da37b18146e086b57a41bc20da8c87ff9ee054a1fa12ea9bfc6a965'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.42.1/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 'a94cf78a105a4d81392bb4178002d4d619bea5769396bdc3f0785d9168f07e07'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.42.1/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 '69fbc43cf291d3d89a15b6f080e07b6645918edba8a3bdbd275d4b7bfd9c1593'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.42.1/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 'e0a565357de52fd9f5001c34aa7410cc2dbc57a7d8be110df2ef985ef7cf1b85'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
