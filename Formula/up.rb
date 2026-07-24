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
  version 'v0.52.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.52.0/bundle/darwin_amd64/up.tar.gz'
    sha256 '6681d04309f0ed22c18ac1fb0e1cfcc531f8b4deb7adac05aaad8f744e24f58c'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.52.0/bundle/darwin_arm64/up.tar.gz'
    sha256 'c8f06af001e3853c6cb191298d21e40ed22a433b1f7da03614c41b0a950f3486'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.52.0/bundle/linux_amd64/up.tar.gz'
    sha256 'ad83f87828e037d5830b9e2aeeb7a38cea3d216511ad22f450d55238fbec403c'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.52.0/bundle/linux_arm64/up.tar.gz'
    sha256 'b980fac89c5950cdea9bd9b689dde0cd51e6dafc876064ba2bd85dab661eff16'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
