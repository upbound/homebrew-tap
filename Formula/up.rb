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
  version 'v0.25.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.25.0/bundle/up/darwin_amd64.tar.gz'
    sha256 '203da59cacc7ba91fa469816bca8d618d0e36270179bd4fd49f16a6be81fec79'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.25.0/bundle/up/darwin_arm64.tar.gz'
    sha256 'b3662f48c786540ccea5ed5467caf4e9d6b9eeb7f0e80dc77970fabd7eb449cd'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.25.0/bundle/up/linux_amd64.tar.gz'
    sha256 'fa87ab91f7a5086df49711e262cc42806692cb353bffbc17635559658b636914'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.25.0/bundle/up/linux_arm.tar.gz'
    sha256 '8f4a4cdff8f91e5092bb74ac206adfc45d4c6903665fe8a8e8148dea151626a4'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.25.0/bundle/up/linux_arm64.tar.gz'
    sha256 'df769782f9d1cbce308955e65657498f5870637acf39cf42b1452e9df47845b0'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
