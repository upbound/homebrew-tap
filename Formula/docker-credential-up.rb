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
  version 'v0.41.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.41.0/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 '575da0f8f126f5099af761aaa0bfdadd69276733250ad5d211fe31ed1cd0bb80'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.41.0/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 '14cba4aa554be449336863d05a8b57dfd50d2df4b860dc60f89aa1852a46b4ca'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.41.0/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 'c9bc9256b7396674853051a04349b2a9ec8256d55aaac81de896f82f02cfd1cf'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.41.0/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 '36071d874e6e00d588ecdc611e64d397560eb9490aa4530a7e5f93dc4dfc74ce'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
