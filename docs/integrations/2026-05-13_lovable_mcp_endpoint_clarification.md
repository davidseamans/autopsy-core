# Lovable MCP Endpoint Clarification

## Date

2026-05-13

## Clarification

The Lovable `Add MCP server` screen requires a real MCP server URL. This URL is not found inside ChatGPT Settings.

ChatGPT app connectors are not automatically MCP servers that Lovable can connect to.

## Current State

Confirmed working:

- ChatGPT to GitHub connector
- ChatGPT to Notion connector
- ChatGPT to Supabase connector
- ChatGPT to Lovable connector

Not confirmed:

- a Lovable-readable MCP server endpoint
- an Autopsy Control Plane MCP server

## Meaning

Lovable is acting as the MCP client.

It needs an external MCP server endpoint such as:

- vendor-provided MCP endpoint
- self-hosted MCP server
- cloud-hosted Autopsy Control Plane MCP server

## Required Fields In Lovable

Server name:

Autopsy Control Plane - Sandbox

Server URL:

Actual MCP endpoint URL, not a placeholder.

Authentication:

OAuth if supported, otherwise Bearer token/API key supplied by the MCP server.

## Directive

Do not invent a URL.

Do not connect Lovable directly to broad write-capable tools.

First Lovable MCP should be read-only, sandboxed, and curated.

## Recommended Architecture

Build or provision an Autopsy Control Plane MCP server that exposes only read-only project context first:

- read_github_structure
- read_notion_canon
- read_supabase_schema_snapshot
- read_lovable_directives
- read_operational_checkpoints

No write actions in Phase 1.