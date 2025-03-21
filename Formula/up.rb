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

class Up < Formula
  desc 'The official Upbound CLI'
  homepage 'https://upbound.io'
  version 'v0.38.4'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.38.4/bundle/up/darwin_amd64.tar.gz'
    sha256 'ccca58c189dc821582afeb0d6d7be373059c8a6bf8a2e73c12c2a62b9d22f735'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.38.4/bundle/up/darwin_arm64.tar.gz'
    sha256 'e834c8506793e0b1915727d4978eb7cbd6f6cc625ac16cd7a7f63468d5a860f2'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.38.4/bundle/up/linux_amd64.tar.gz'
    sha256 '7fa82011457d091595706fd1918ce6c1a394963c6725ea15b21c243992f74e87'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.38.4/bundle/up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.38.4/bundle/up/linux_arm64.tar.gz'
    sha256 '6e047d3921d1585406e744d6b7b6fcafd19d6ffc44d29b39caedf70b9f24df52'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
