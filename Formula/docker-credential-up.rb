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
  version 'v0.45.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.45.0/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 'b51ca0b8f6a6967980cc945d41a01a5f9d2e463bc6f3bbff31fefc9a925b4bb1'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.45.0/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 'bc01e57a33dc86f4e6c5e8fb3760edc09772558141ac8ef0ff9d069a68385f03'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.45.0/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 '2ed8868671f74c2d296bafaebf0f13f145682ad2513f811f886cb3c2f548f2a0'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.45.0/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 '5d7d8e250cd45b3cb1887424bc74aee52c922172d3933eaf85303c49b4255fb3'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
