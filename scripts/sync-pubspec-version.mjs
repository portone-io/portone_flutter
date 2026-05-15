#!/usr/bin/env node
import { readFile, writeFile } from "node:fs/promises";
import { fileURLToPath } from "node:url";
import { dirname, resolve } from "node:path";

const repoRoot = resolve(dirname(fileURLToPath(import.meta.url)), "..");
const packageJsonPath = resolve(repoRoot, "package.json");
const pubspecPath = resolve(repoRoot, "pubspec.yaml");

const pkg = JSON.parse(await readFile(packageJsonPath, "utf8"));
const nextVersion = pkg.version;
if (typeof nextVersion !== "string" || nextVersion.length === 0) {
  console.error("package.json 의 version 필드가 비어 있습니다.");
  process.exit(1);
}

const pubspec = await readFile(pubspecPath, "utf8");
const versionLine = /^version:\s*.*$/m;
if (!versionLine.test(pubspec)) {
  console.error("pubspec.yaml 에서 'version:' 라인을 찾지 못했습니다.");
  process.exit(1);
}

const nextPubspec = pubspec.replace(versionLine, `version: ${nextVersion}`);
if (nextPubspec === pubspec) {
  console.log(`pubspec.yaml 의 version 이 이미 ${nextVersion} 입니다. 변경 없음.`);
  process.exit(0);
}

await writeFile(pubspecPath, nextPubspec);
console.log(`pubspec.yaml version 을 ${nextVersion} 로 갱신했습니다.`);
