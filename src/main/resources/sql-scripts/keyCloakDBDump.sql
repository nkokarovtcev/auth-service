--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.1

-- Started on 2024-08-29 17:12:12 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 16385)
-- Name: keycloak; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA keycloak;


ALTER SCHEMA keycloak OWNER TO admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 257 (class 1259 OID 17021)
-- Name: admin_event_entity; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE keycloak.admin_event_entity OWNER TO admin;

--
-- TOC entry 286 (class 1259 OID 17464)
-- Name: associated_policy; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.associated_policy OWNER TO admin;

--
-- TOC entry 260 (class 1259 OID 17036)
-- Name: authentication_execution; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE keycloak.authentication_execution OWNER TO admin;

--
-- TOC entry 259 (class 1259 OID 17031)
-- Name: authentication_flow; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE keycloak.authentication_flow OWNER TO admin;

--
-- TOC entry 258 (class 1259 OID 17026)
-- Name: authenticator_config; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE keycloak.authenticator_config OWNER TO admin;

--
-- TOC entry 261 (class 1259 OID 17041)
-- Name: authenticator_config_entry; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.authenticator_config_entry OWNER TO admin;

--
-- TOC entry 287 (class 1259 OID 17479)
-- Name: broker_link; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE keycloak.broker_link OWNER TO admin;

--
-- TOC entry 218 (class 1259 OID 16402)
-- Name: client; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE keycloak.client OWNER TO admin;

--
-- TOC entry 241 (class 1259 OID 16760)
-- Name: client_attributes; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE keycloak.client_attributes OWNER TO admin;

--
-- TOC entry 298 (class 1259 OID 17728)
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE keycloak.client_auth_flow_bindings OWNER TO admin;

--
-- TOC entry 297 (class 1259 OID 17603)
-- Name: client_initial_access; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE keycloak.client_initial_access OWNER TO admin;

--
-- TOC entry 243 (class 1259 OID 16770)
-- Name: client_node_registrations; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.client_node_registrations OWNER TO admin;

--
-- TOC entry 275 (class 1259 OID 17269)
-- Name: client_scope; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE keycloak.client_scope OWNER TO admin;

--
-- TOC entry 276 (class 1259 OID 17283)
-- Name: client_scope_attributes; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.client_scope_attributes OWNER TO admin;

--
-- TOC entry 299 (class 1259 OID 17769)
-- Name: client_scope_client; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE keycloak.client_scope_client OWNER TO admin;

--
-- TOC entry 277 (class 1259 OID 17288)
-- Name: client_scope_role_mapping; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.client_scope_role_mapping OWNER TO admin;

--
-- TOC entry 219 (class 1259 OID 16413)
-- Name: client_session; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE keycloak.client_session OWNER TO admin;

--
-- TOC entry 264 (class 1259 OID 17059)
-- Name: client_session_auth_status; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE keycloak.client_session_auth_status OWNER TO admin;

--
-- TOC entry 242 (class 1259 OID 16765)
-- Name: client_session_note; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE keycloak.client_session_note OWNER TO admin;

--
-- TOC entry 256 (class 1259 OID 16943)
-- Name: client_session_prot_mapper; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE keycloak.client_session_prot_mapper OWNER TO admin;

--
-- TOC entry 220 (class 1259 OID 16418)
-- Name: client_session_role; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE keycloak.client_session_role OWNER TO admin;

--
-- TOC entry 265 (class 1259 OID 17140)
-- Name: client_user_session_note; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE keycloak.client_user_session_note OWNER TO admin;

--
-- TOC entry 295 (class 1259 OID 17524)
-- Name: component; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE keycloak.component OWNER TO admin;

--
-- TOC entry 294 (class 1259 OID 17519)
-- Name: component_config; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE keycloak.component_config OWNER TO admin;

--
-- TOC entry 221 (class 1259 OID 16421)
-- Name: composite_role; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE keycloak.composite_role OWNER TO admin;

--
-- TOC entry 222 (class 1259 OID 16424)
-- Name: credential; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE keycloak.credential OWNER TO admin;

--
-- TOC entry 217 (class 1259 OID 16394)
-- Name: databasechangelog; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE keycloak.databasechangelog OWNER TO admin;

--
-- TOC entry 216 (class 1259 OID 16389)
-- Name: databasechangeloglock; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE keycloak.databasechangeloglock OWNER TO admin;

--
-- TOC entry 300 (class 1259 OID 17785)
-- Name: default_client_scope; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE keycloak.default_client_scope OWNER TO admin;

--
-- TOC entry 223 (class 1259 OID 16429)
-- Name: event_entity; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE keycloak.event_entity OWNER TO admin;

--
-- TOC entry 288 (class 1259 OID 17484)
-- Name: fed_user_attribute; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE keycloak.fed_user_attribute OWNER TO admin;

--
-- TOC entry 289 (class 1259 OID 17489)
-- Name: fed_user_consent; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE keycloak.fed_user_consent OWNER TO admin;

--
-- TOC entry 302 (class 1259 OID 17811)
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.fed_user_consent_cl_scope OWNER TO admin;

--
-- TOC entry 290 (class 1259 OID 17498)
-- Name: fed_user_credential; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE keycloak.fed_user_credential OWNER TO admin;

--
-- TOC entry 291 (class 1259 OID 17507)
-- Name: fed_user_group_membership; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE keycloak.fed_user_group_membership OWNER TO admin;

--
-- TOC entry 292 (class 1259 OID 17510)
-- Name: fed_user_required_action; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE keycloak.fed_user_required_action OWNER TO admin;

--
-- TOC entry 293 (class 1259 OID 17516)
-- Name: fed_user_role_mapping; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE keycloak.fed_user_role_mapping OWNER TO admin;

--
-- TOC entry 246 (class 1259 OID 16806)
-- Name: federated_identity; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.federated_identity OWNER TO admin;

--
-- TOC entry 296 (class 1259 OID 17581)
-- Name: federated_user; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.federated_user OWNER TO admin;

--
-- TOC entry 272 (class 1259 OID 17208)
-- Name: group_attribute; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.group_attribute OWNER TO admin;

--
-- TOC entry 271 (class 1259 OID 17205)
-- Name: group_role_mapping; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.group_role_mapping OWNER TO admin;

--
-- TOC entry 247 (class 1259 OID 16811)
-- Name: identity_provider; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE keycloak.identity_provider OWNER TO admin;

--
-- TOC entry 248 (class 1259 OID 16820)
-- Name: identity_provider_config; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.identity_provider_config OWNER TO admin;

--
-- TOC entry 253 (class 1259 OID 16924)
-- Name: identity_provider_mapper; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.identity_provider_mapper OWNER TO admin;

--
-- TOC entry 254 (class 1259 OID 16929)
-- Name: idp_mapper_config; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.idp_mapper_config OWNER TO admin;

--
-- TOC entry 270 (class 1259 OID 17202)
-- Name: keycloak_group; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE keycloak.keycloak_group OWNER TO admin;

--
-- TOC entry 224 (class 1259 OID 16437)
-- Name: keycloak_role; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE keycloak.keycloak_role OWNER TO admin;

--
-- TOC entry 252 (class 1259 OID 16921)
-- Name: migration_model; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE keycloak.migration_model OWNER TO admin;

--
-- TOC entry 269 (class 1259 OID 17193)
-- Name: offline_client_session; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE keycloak.offline_client_session OWNER TO admin;

--
-- TOC entry 268 (class 1259 OID 17188)
-- Name: offline_user_session; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE keycloak.offline_user_session OWNER TO admin;

--
-- TOC entry 282 (class 1259 OID 17407)
-- Name: policy_config; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE keycloak.policy_config OWNER TO admin;

--
-- TOC entry 244 (class 1259 OID 16795)
-- Name: protocol_mapper; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE keycloak.protocol_mapper OWNER TO admin;

--
-- TOC entry 245 (class 1259 OID 16801)
-- Name: protocol_mapper_config; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.protocol_mapper_config OWNER TO admin;

--
-- TOC entry 225 (class 1259 OID 16443)
-- Name: realm; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE keycloak.realm OWNER TO admin;

--
-- TOC entry 226 (class 1259 OID 16460)
-- Name: realm_attribute; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE keycloak.realm_attribute OWNER TO admin;

--
-- TOC entry 274 (class 1259 OID 17217)
-- Name: realm_default_groups; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.realm_default_groups OWNER TO admin;

--
-- TOC entry 251 (class 1259 OID 16913)
-- Name: realm_enabled_event_types; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE keycloak.realm_enabled_event_types OWNER TO admin;

--
-- TOC entry 227 (class 1259 OID 16468)
-- Name: realm_events_listeners; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE keycloak.realm_events_listeners OWNER TO admin;

--
-- TOC entry 307 (class 1259 OID 17919)
-- Name: realm_localizations; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE keycloak.realm_localizations OWNER TO admin;

--
-- TOC entry 228 (class 1259 OID 16471)
-- Name: realm_required_credential; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.realm_required_credential OWNER TO admin;

--
-- TOC entry 229 (class 1259 OID 16478)
-- Name: realm_smtp_config; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.realm_smtp_config OWNER TO admin;

--
-- TOC entry 249 (class 1259 OID 16829)
-- Name: realm_supported_locales; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE keycloak.realm_supported_locales OWNER TO admin;

--
-- TOC entry 230 (class 1259 OID 16488)
-- Name: redirect_uris; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE keycloak.redirect_uris OWNER TO admin;

--
-- TOC entry 267 (class 1259 OID 17152)
-- Name: required_action_config; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.required_action_config OWNER TO admin;

--
-- TOC entry 266 (class 1259 OID 17145)
-- Name: required_action_provider; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE keycloak.required_action_provider OWNER TO admin;

--
-- TOC entry 304 (class 1259 OID 17850)
-- Name: resource_attribute; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.resource_attribute OWNER TO admin;

--
-- TOC entry 284 (class 1259 OID 17434)
-- Name: resource_policy; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.resource_policy OWNER TO admin;

--
-- TOC entry 283 (class 1259 OID 17419)
-- Name: resource_scope; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.resource_scope OWNER TO admin;

--
-- TOC entry 278 (class 1259 OID 17357)
-- Name: resource_server; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE keycloak.resource_server OWNER TO admin;

--
-- TOC entry 303 (class 1259 OID 17826)
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE keycloak.resource_server_perm_ticket OWNER TO admin;

--
-- TOC entry 281 (class 1259 OID 17393)
-- Name: resource_server_policy; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE keycloak.resource_server_policy OWNER TO admin;

--
-- TOC entry 279 (class 1259 OID 17365)
-- Name: resource_server_resource; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE keycloak.resource_server_resource OWNER TO admin;

--
-- TOC entry 280 (class 1259 OID 17379)
-- Name: resource_server_scope; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE keycloak.resource_server_scope OWNER TO admin;

--
-- TOC entry 305 (class 1259 OID 17868)
-- Name: resource_uris; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE keycloak.resource_uris OWNER TO admin;

--
-- TOC entry 306 (class 1259 OID 17878)
-- Name: role_attribute; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE keycloak.role_attribute OWNER TO admin;

--
-- TOC entry 231 (class 1259 OID 16491)
-- Name: scope_mapping; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.scope_mapping OWNER TO admin;

--
-- TOC entry 285 (class 1259 OID 17449)
-- Name: scope_policy; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.scope_policy OWNER TO admin;

--
-- TOC entry 233 (class 1259 OID 16497)
-- Name: user_attribute; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE keycloak.user_attribute OWNER TO admin;

--
-- TOC entry 255 (class 1259 OID 16934)
-- Name: user_consent; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE keycloak.user_consent OWNER TO admin;

--
-- TOC entry 301 (class 1259 OID 17801)
-- Name: user_consent_client_scope; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.user_consent_client_scope OWNER TO admin;

--
-- TOC entry 234 (class 1259 OID 16502)
-- Name: user_entity; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE keycloak.user_entity OWNER TO admin;

--
-- TOC entry 235 (class 1259 OID 16510)
-- Name: user_federation_config; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.user_federation_config OWNER TO admin;

--
-- TOC entry 262 (class 1259 OID 17046)
-- Name: user_federation_mapper; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.user_federation_mapper OWNER TO admin;

--
-- TOC entry 263 (class 1259 OID 17051)
-- Name: user_federation_mapper_config; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE keycloak.user_federation_mapper_config OWNER TO admin;

--
-- TOC entry 236 (class 1259 OID 16515)
-- Name: user_federation_provider; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE keycloak.user_federation_provider OWNER TO admin;

--
-- TOC entry 273 (class 1259 OID 17214)
-- Name: user_group_membership; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.user_group_membership OWNER TO admin;

--
-- TOC entry 237 (class 1259 OID 16520)
-- Name: user_required_action; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE keycloak.user_required_action OWNER TO admin;

--
-- TOC entry 238 (class 1259 OID 16523)
-- Name: user_role_mapping; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE keycloak.user_role_mapping OWNER TO admin;

--
-- TOC entry 239 (class 1259 OID 16526)
-- Name: user_session; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE keycloak.user_session OWNER TO admin;

--
-- TOC entry 250 (class 1259 OID 16832)
-- Name: user_session_note; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE keycloak.user_session_note OWNER TO admin;

--
-- TOC entry 232 (class 1259 OID 16494)
-- Name: username_login_failure; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE keycloak.username_login_failure OWNER TO admin;

--
-- TOC entry 240 (class 1259 OID 16537)
-- Name: web_origins; Type: TABLE; Schema: keycloak; Owner: admin
--

CREATE TABLE keycloak.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE keycloak.web_origins OWNER TO admin;

--
-- TOC entry 4192 (class 0 OID 17021)
-- Dependencies: 257
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- TOC entry 4221 (class 0 OID 17464)
-- Dependencies: 286
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- TOC entry 4195 (class 0 OID 17036)
-- Dependencies: 260
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
afcc5ced-d52d-40b8-8d63-6700d0aa5b7e	\N	auth-cookie	dbdc26c7-3f31-4332-bae9-a245a94f1c51	4d00a8e7-a858-45fa-849c-8b21d09ba34b	2	10	f	\N	\N
27180040-2a27-444b-a5f7-f8c6d2771bde	\N	auth-spnego	dbdc26c7-3f31-4332-bae9-a245a94f1c51	4d00a8e7-a858-45fa-849c-8b21d09ba34b	3	20	f	\N	\N
1cdda8d6-c069-414f-a2a8-dca0863e418a	\N	identity-provider-redirector	dbdc26c7-3f31-4332-bae9-a245a94f1c51	4d00a8e7-a858-45fa-849c-8b21d09ba34b	2	25	f	\N	\N
53dc1c0c-feaa-4e0a-9584-e43ce0af4d85	\N	\N	dbdc26c7-3f31-4332-bae9-a245a94f1c51	4d00a8e7-a858-45fa-849c-8b21d09ba34b	2	30	t	be38bef5-aad1-4384-b4cd-4ccae4a16b6d	\N
067d0c4e-b0c0-4e80-ac0d-0b7fcea6cd8c	\N	auth-username-password-form	dbdc26c7-3f31-4332-bae9-a245a94f1c51	be38bef5-aad1-4384-b4cd-4ccae4a16b6d	0	10	f	\N	\N
99ba7163-65b0-46c3-be4e-9ad86c91007a	\N	\N	dbdc26c7-3f31-4332-bae9-a245a94f1c51	be38bef5-aad1-4384-b4cd-4ccae4a16b6d	1	20	t	adb890dc-3b39-43e3-832c-ed852fd2ebf8	\N
e3c13d8a-6dac-4b1c-ad6a-1895c121f912	\N	conditional-user-configured	dbdc26c7-3f31-4332-bae9-a245a94f1c51	adb890dc-3b39-43e3-832c-ed852fd2ebf8	0	10	f	\N	\N
b9002ac0-fdc0-4ff7-93c7-a901d54a8ae2	\N	auth-otp-form	dbdc26c7-3f31-4332-bae9-a245a94f1c51	adb890dc-3b39-43e3-832c-ed852fd2ebf8	0	20	f	\N	\N
690703a8-c3b7-414f-a21d-a1f4a908f45c	\N	direct-grant-validate-username	dbdc26c7-3f31-4332-bae9-a245a94f1c51	03363fc4-835d-4a9e-86f5-f837478b5b04	0	10	f	\N	\N
217db8a4-96b0-4e66-a4f9-6183112e7a4a	\N	direct-grant-validate-password	dbdc26c7-3f31-4332-bae9-a245a94f1c51	03363fc4-835d-4a9e-86f5-f837478b5b04	0	20	f	\N	\N
f8fa2d4e-9502-45c6-a7fe-d3c9703308ff	\N	\N	dbdc26c7-3f31-4332-bae9-a245a94f1c51	03363fc4-835d-4a9e-86f5-f837478b5b04	1	30	t	2d8b88e4-3b21-4749-9aba-24f47ecaf4a7	\N
46e92746-fee8-4619-bd3f-e648b0ee552a	\N	conditional-user-configured	dbdc26c7-3f31-4332-bae9-a245a94f1c51	2d8b88e4-3b21-4749-9aba-24f47ecaf4a7	0	10	f	\N	\N
38827c9f-852f-4f45-8d9a-19765fd608e4	\N	direct-grant-validate-otp	dbdc26c7-3f31-4332-bae9-a245a94f1c51	2d8b88e4-3b21-4749-9aba-24f47ecaf4a7	0	20	f	\N	\N
8ee4a106-1c16-401e-8a45-47735b029238	\N	registration-page-form	dbdc26c7-3f31-4332-bae9-a245a94f1c51	2fbfd389-9233-4973-bd35-232e5bad05fb	0	10	t	7b6a8371-bd89-415c-ad0e-b44cda74e3ae	\N
0d015cc3-df73-4bcb-bf7a-9d84ab69876a	\N	registration-user-creation	dbdc26c7-3f31-4332-bae9-a245a94f1c51	7b6a8371-bd89-415c-ad0e-b44cda74e3ae	0	20	f	\N	\N
e3e48ee1-264b-4647-9554-f6c7e13a579d	\N	registration-profile-action	dbdc26c7-3f31-4332-bae9-a245a94f1c51	7b6a8371-bd89-415c-ad0e-b44cda74e3ae	0	40	f	\N	\N
4066589f-83b2-4d1f-81eb-ea8d9421595e	\N	registration-password-action	dbdc26c7-3f31-4332-bae9-a245a94f1c51	7b6a8371-bd89-415c-ad0e-b44cda74e3ae	0	50	f	\N	\N
fdf06aa3-c873-4dcf-a8a4-8add4e7eae87	\N	registration-recaptcha-action	dbdc26c7-3f31-4332-bae9-a245a94f1c51	7b6a8371-bd89-415c-ad0e-b44cda74e3ae	3	60	f	\N	\N
6cf20258-53ec-4941-833b-ac8cf60f1fa9	\N	registration-terms-and-conditions	dbdc26c7-3f31-4332-bae9-a245a94f1c51	7b6a8371-bd89-415c-ad0e-b44cda74e3ae	3	70	f	\N	\N
0f7bff25-0cae-49c5-abc2-d39ae3755619	\N	reset-credentials-choose-user	dbdc26c7-3f31-4332-bae9-a245a94f1c51	1bc65055-8c96-48a8-82e8-1581ba7c3ea9	0	10	f	\N	\N
3d55165c-c228-4d40-b464-ec413b02da53	\N	reset-credential-email	dbdc26c7-3f31-4332-bae9-a245a94f1c51	1bc65055-8c96-48a8-82e8-1581ba7c3ea9	0	20	f	\N	\N
bf029690-893d-4858-ae66-6bef1d0f3615	\N	reset-password	dbdc26c7-3f31-4332-bae9-a245a94f1c51	1bc65055-8c96-48a8-82e8-1581ba7c3ea9	0	30	f	\N	\N
83739827-f76e-4f54-a840-96239de7f9dc	\N	\N	dbdc26c7-3f31-4332-bae9-a245a94f1c51	1bc65055-8c96-48a8-82e8-1581ba7c3ea9	1	40	t	e1ea0a1f-7ebc-479f-a25e-7adacef90920	\N
039c0d7f-614a-4eb0-b37f-a3844c6199c0	\N	conditional-user-configured	dbdc26c7-3f31-4332-bae9-a245a94f1c51	e1ea0a1f-7ebc-479f-a25e-7adacef90920	0	10	f	\N	\N
6bd51d3e-1870-4034-83a5-541648b057ef	\N	reset-otp	dbdc26c7-3f31-4332-bae9-a245a94f1c51	e1ea0a1f-7ebc-479f-a25e-7adacef90920	0	20	f	\N	\N
2cd5a9fb-03b2-4332-bcc7-f2562aa16800	\N	client-secret	dbdc26c7-3f31-4332-bae9-a245a94f1c51	b2f55077-8e56-4edf-ad3c-a88fa7dc9147	2	10	f	\N	\N
24c44b0f-dfb9-4ae5-8281-22c1eab4a97a	\N	client-jwt	dbdc26c7-3f31-4332-bae9-a245a94f1c51	b2f55077-8e56-4edf-ad3c-a88fa7dc9147	2	20	f	\N	\N
89eec168-31ae-4c5b-bf3d-b30aff676a65	\N	client-secret-jwt	dbdc26c7-3f31-4332-bae9-a245a94f1c51	b2f55077-8e56-4edf-ad3c-a88fa7dc9147	2	30	f	\N	\N
80f1e7f5-16af-4cf7-823d-3b903a3a2a30	\N	client-x509	dbdc26c7-3f31-4332-bae9-a245a94f1c51	b2f55077-8e56-4edf-ad3c-a88fa7dc9147	2	40	f	\N	\N
598a49ed-bdf3-4034-98e2-eb022fe13eba	\N	idp-review-profile	dbdc26c7-3f31-4332-bae9-a245a94f1c51	0fa4f3f8-b603-4fcf-822a-03f1910dc183	0	10	f	\N	ab7938ee-59b2-4947-a383-a5cdd4c66b3b
6ffe9c48-0763-4acf-9e58-2c54078d2bbe	\N	\N	dbdc26c7-3f31-4332-bae9-a245a94f1c51	0fa4f3f8-b603-4fcf-822a-03f1910dc183	0	20	t	4bf394e6-23e7-45cf-a4f6-defb5ece5742	\N
f27db554-e397-4baf-a25c-806b45d8c367	\N	idp-create-user-if-unique	dbdc26c7-3f31-4332-bae9-a245a94f1c51	4bf394e6-23e7-45cf-a4f6-defb5ece5742	2	10	f	\N	6fa21960-3897-4558-86c7-e0661523b2e6
cb3a440b-a484-40ef-86dc-8537804cc5e6	\N	\N	dbdc26c7-3f31-4332-bae9-a245a94f1c51	4bf394e6-23e7-45cf-a4f6-defb5ece5742	2	20	t	9d3d2599-1593-40c3-bcbe-33035b6b7d53	\N
bbbac017-238b-4809-97a0-7b490a8c97a4	\N	idp-confirm-link	dbdc26c7-3f31-4332-bae9-a245a94f1c51	9d3d2599-1593-40c3-bcbe-33035b6b7d53	0	10	f	\N	\N
a422d3ad-3135-40d6-a7ac-b4c56190350a	\N	\N	dbdc26c7-3f31-4332-bae9-a245a94f1c51	9d3d2599-1593-40c3-bcbe-33035b6b7d53	0	20	t	eff7887f-10a3-4a7b-9669-8a28f99ab50b	\N
841c4452-e72a-4334-b4f8-8fcdb00aee25	\N	idp-email-verification	dbdc26c7-3f31-4332-bae9-a245a94f1c51	eff7887f-10a3-4a7b-9669-8a28f99ab50b	2	10	f	\N	\N
12cd0c73-e554-49d0-9218-3947be46f403	\N	\N	dbdc26c7-3f31-4332-bae9-a245a94f1c51	eff7887f-10a3-4a7b-9669-8a28f99ab50b	2	20	t	5a39ed0c-6108-47b8-9100-23e732c25a73	\N
6cfb18d6-f8eb-48fc-a1b8-1d27241e102c	\N	idp-username-password-form	dbdc26c7-3f31-4332-bae9-a245a94f1c51	5a39ed0c-6108-47b8-9100-23e732c25a73	0	10	f	\N	\N
aabb3d61-fb23-4a92-926f-011ddc3ab071	\N	\N	dbdc26c7-3f31-4332-bae9-a245a94f1c51	5a39ed0c-6108-47b8-9100-23e732c25a73	1	20	t	4ce742df-9886-47c1-9048-f2b857e53982	\N
37c7dc87-3c3f-45d1-b0d1-b3f6cd0ec848	\N	conditional-user-configured	dbdc26c7-3f31-4332-bae9-a245a94f1c51	4ce742df-9886-47c1-9048-f2b857e53982	0	10	f	\N	\N
a0659ded-cfd8-41ca-b1f0-afd3444fcb8f	\N	auth-otp-form	dbdc26c7-3f31-4332-bae9-a245a94f1c51	4ce742df-9886-47c1-9048-f2b857e53982	0	20	f	\N	\N
4b6fd98d-be69-4a8b-b29a-edd6538fa7fb	\N	http-basic-authenticator	dbdc26c7-3f31-4332-bae9-a245a94f1c51	7007af84-adcc-4770-a052-1f41fc6461db	0	10	f	\N	\N
94f86bfe-764f-44d0-a5f2-f0b7a064e8c6	\N	docker-http-basic-authenticator	dbdc26c7-3f31-4332-bae9-a245a94f1c51	6d4ae779-fa2b-4510-be6e-7f9843be8284	0	10	f	\N	\N
25c65ac5-609d-4dd2-ac5c-c0ee0a859356	\N	auth-cookie	e714c293-8916-447d-acec-a6202b90ae13	8d144703-7546-4239-bc93-4ac2dff6e58a	2	10	f	\N	\N
078ce9b8-e1c5-46ed-9438-b3a01e1f2bb5	\N	auth-spnego	e714c293-8916-447d-acec-a6202b90ae13	8d144703-7546-4239-bc93-4ac2dff6e58a	3	20	f	\N	\N
f90fcb88-47a1-4533-9162-70e8035cb3f1	\N	identity-provider-redirector	e714c293-8916-447d-acec-a6202b90ae13	8d144703-7546-4239-bc93-4ac2dff6e58a	2	25	f	\N	\N
151e26f5-1401-4a5b-8546-d57d6416ff78	\N	\N	e714c293-8916-447d-acec-a6202b90ae13	8d144703-7546-4239-bc93-4ac2dff6e58a	2	30	t	bfaa4f62-d076-44ef-8c9a-46023b93671b	\N
563a2e6e-5589-4b6c-b8c8-e50bad344ffb	\N	auth-username-password-form	e714c293-8916-447d-acec-a6202b90ae13	bfaa4f62-d076-44ef-8c9a-46023b93671b	0	10	f	\N	\N
ecab81d7-5642-440b-99d9-9bcba28a4f60	\N	\N	e714c293-8916-447d-acec-a6202b90ae13	bfaa4f62-d076-44ef-8c9a-46023b93671b	1	20	t	7d8619d0-ed7a-410d-b4d4-6dd7cc8ef604	\N
e26f0bab-5191-444e-9d33-37ab6aaf1780	\N	conditional-user-configured	e714c293-8916-447d-acec-a6202b90ae13	7d8619d0-ed7a-410d-b4d4-6dd7cc8ef604	0	10	f	\N	\N
074dc517-eea4-45f0-bd19-5a080a6acb8f	\N	auth-otp-form	e714c293-8916-447d-acec-a6202b90ae13	7d8619d0-ed7a-410d-b4d4-6dd7cc8ef604	0	20	f	\N	\N
6b949db1-da7f-4535-9cd3-5c28d23d8236	\N	direct-grant-validate-username	e714c293-8916-447d-acec-a6202b90ae13	06d8f350-000f-45f2-885e-6d718a487fdc	0	10	f	\N	\N
c4df01c1-3695-4a15-a5dd-5e57be2459f0	\N	direct-grant-validate-password	e714c293-8916-447d-acec-a6202b90ae13	06d8f350-000f-45f2-885e-6d718a487fdc	0	20	f	\N	\N
f2001c68-d0ca-45bd-b105-6a5f50ea7a60	\N	\N	e714c293-8916-447d-acec-a6202b90ae13	06d8f350-000f-45f2-885e-6d718a487fdc	1	30	t	25816dac-8977-444b-abeb-391cdea1be3a	\N
1f731d6a-21c9-4196-a01b-00c9f01fc2b4	\N	conditional-user-configured	e714c293-8916-447d-acec-a6202b90ae13	25816dac-8977-444b-abeb-391cdea1be3a	0	10	f	\N	\N
5780e0cd-fc8f-403b-9a86-ae845b6d336e	\N	direct-grant-validate-otp	e714c293-8916-447d-acec-a6202b90ae13	25816dac-8977-444b-abeb-391cdea1be3a	0	20	f	\N	\N
04176208-d216-45f6-980f-1fd9c2760a05	\N	registration-page-form	e714c293-8916-447d-acec-a6202b90ae13	d54dab90-8788-42b5-b1e9-674bab2dd267	0	10	t	ebcbe12d-ac1a-41b2-8140-25727ea5640c	\N
6daa15f5-f506-4f60-ae95-0984d6cfe56c	\N	registration-user-creation	e714c293-8916-447d-acec-a6202b90ae13	ebcbe12d-ac1a-41b2-8140-25727ea5640c	0	20	f	\N	\N
83e21c70-84a7-4a27-a4ed-5401f1f9dea8	\N	registration-profile-action	e714c293-8916-447d-acec-a6202b90ae13	ebcbe12d-ac1a-41b2-8140-25727ea5640c	0	40	f	\N	\N
b139f8c4-54d4-461b-a96b-22b2865295b6	\N	registration-password-action	e714c293-8916-447d-acec-a6202b90ae13	ebcbe12d-ac1a-41b2-8140-25727ea5640c	0	50	f	\N	\N
6886eedb-083a-4682-b56b-552850fcb469	\N	registration-recaptcha-action	e714c293-8916-447d-acec-a6202b90ae13	ebcbe12d-ac1a-41b2-8140-25727ea5640c	3	60	f	\N	\N
ff4ad9ef-bbbd-4532-bcb5-3511f1dd1ffb	\N	reset-credentials-choose-user	e714c293-8916-447d-acec-a6202b90ae13	795368f4-bb8b-49cd-b18c-a286ab94ef02	0	10	f	\N	\N
8ee7f642-f031-4d0d-abe4-323feef01c37	\N	reset-credential-email	e714c293-8916-447d-acec-a6202b90ae13	795368f4-bb8b-49cd-b18c-a286ab94ef02	0	20	f	\N	\N
6000b350-1b06-451f-883d-99e277d30d45	\N	reset-password	e714c293-8916-447d-acec-a6202b90ae13	795368f4-bb8b-49cd-b18c-a286ab94ef02	0	30	f	\N	\N
47811902-8a5f-4c85-a9df-3488b376d84c	\N	\N	e714c293-8916-447d-acec-a6202b90ae13	795368f4-bb8b-49cd-b18c-a286ab94ef02	1	40	t	d0ca43ab-3c27-436a-867a-930d434b634c	\N
0323b4ce-1e40-47fb-8f2f-ebe1cfd12514	\N	conditional-user-configured	e714c293-8916-447d-acec-a6202b90ae13	d0ca43ab-3c27-436a-867a-930d434b634c	0	10	f	\N	\N
99569660-08a5-4d8a-8c8e-b5e4d2c798c8	\N	reset-otp	e714c293-8916-447d-acec-a6202b90ae13	d0ca43ab-3c27-436a-867a-930d434b634c	0	20	f	\N	\N
f8fab1e6-4529-49e0-bf65-7561066f0ee0	\N	client-secret	e714c293-8916-447d-acec-a6202b90ae13	02bff3de-ebce-4f17-86ee-926576ef70d6	2	10	f	\N	\N
4c1a4da4-e047-4e50-9fd0-ed255a274eec	\N	client-jwt	e714c293-8916-447d-acec-a6202b90ae13	02bff3de-ebce-4f17-86ee-926576ef70d6	2	20	f	\N	\N
c9756d4b-2e11-4ecb-9cf8-d35c62c2937c	\N	client-secret-jwt	e714c293-8916-447d-acec-a6202b90ae13	02bff3de-ebce-4f17-86ee-926576ef70d6	2	30	f	\N	\N
f9950dc2-7b50-4484-8432-b8f61481a82b	\N	client-x509	e714c293-8916-447d-acec-a6202b90ae13	02bff3de-ebce-4f17-86ee-926576ef70d6	2	40	f	\N	\N
bd4ab83b-2431-4c5d-a6ae-421f88bd5cc6	\N	idp-review-profile	e714c293-8916-447d-acec-a6202b90ae13	b019c160-9fe8-4a17-bbcc-97a0ba696421	0	10	f	\N	5399b674-c0a7-4a04-84cb-b9ec29776078
4b67e890-6249-480c-a919-7134b3be38a4	\N	\N	e714c293-8916-447d-acec-a6202b90ae13	b019c160-9fe8-4a17-bbcc-97a0ba696421	0	20	t	bc00d366-5fc7-49d9-afc7-5d17ec8b8212	\N
7685aae9-9abd-4f85-8424-ead41f0f9a0a	\N	idp-create-user-if-unique	e714c293-8916-447d-acec-a6202b90ae13	bc00d366-5fc7-49d9-afc7-5d17ec8b8212	2	10	f	\N	1ea2fb2c-3a97-434d-b24a-84fb4cf855d1
339cb0c6-b486-4e8f-b1b7-99f9073b877d	\N	\N	e714c293-8916-447d-acec-a6202b90ae13	bc00d366-5fc7-49d9-afc7-5d17ec8b8212	2	20	t	d5f3afd6-db6e-442f-8629-92f25a1ead01	\N
0ae27e18-475e-41ee-b3db-9dad24ae2d61	\N	idp-confirm-link	e714c293-8916-447d-acec-a6202b90ae13	d5f3afd6-db6e-442f-8629-92f25a1ead01	0	10	f	\N	\N
14067dc5-fdfc-4a09-b315-43adf092722a	\N	\N	e714c293-8916-447d-acec-a6202b90ae13	d5f3afd6-db6e-442f-8629-92f25a1ead01	0	20	t	3f2719e8-5228-4170-a6a3-32f538189cfd	\N
554f2d5a-588c-421b-9154-308cb96319cd	\N	idp-email-verification	e714c293-8916-447d-acec-a6202b90ae13	3f2719e8-5228-4170-a6a3-32f538189cfd	2	10	f	\N	\N
2317fbd0-cf77-41da-a6a2-934e323655d7	\N	\N	e714c293-8916-447d-acec-a6202b90ae13	3f2719e8-5228-4170-a6a3-32f538189cfd	2	20	t	b3788312-886d-42e0-957f-85cd036f6e7f	\N
e382e78e-5f48-4b90-b7ba-a08c6a492214	\N	idp-username-password-form	e714c293-8916-447d-acec-a6202b90ae13	b3788312-886d-42e0-957f-85cd036f6e7f	0	10	f	\N	\N
3952915d-ff2b-48c3-9a55-564367c59410	\N	\N	e714c293-8916-447d-acec-a6202b90ae13	b3788312-886d-42e0-957f-85cd036f6e7f	1	20	t	0b407638-d2bc-450f-acf1-25a7eb598f42	\N
4353fd9e-c5f1-435d-8c03-e642d1f03c29	\N	conditional-user-configured	e714c293-8916-447d-acec-a6202b90ae13	0b407638-d2bc-450f-acf1-25a7eb598f42	0	10	f	\N	\N
07ecb5dc-4837-4fa4-bea3-aa3ae09e9597	\N	auth-otp-form	e714c293-8916-447d-acec-a6202b90ae13	0b407638-d2bc-450f-acf1-25a7eb598f42	0	20	f	\N	\N
01bd3a0b-30b7-4aad-8239-6e023a81d180	\N	http-basic-authenticator	e714c293-8916-447d-acec-a6202b90ae13	bc999733-89a6-4f76-86d4-da684735e219	0	10	f	\N	\N
897186bb-3763-4321-a9b4-6811846c6763	\N	docker-http-basic-authenticator	e714c293-8916-447d-acec-a6202b90ae13	2a71158f-343d-4e18-8a5d-f523b10c60be	0	10	f	\N	\N
\.


--
-- TOC entry 4194 (class 0 OID 17031)
-- Dependencies: 259
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
4d00a8e7-a858-45fa-849c-8b21d09ba34b	browser	browser based authentication	dbdc26c7-3f31-4332-bae9-a245a94f1c51	basic-flow	t	t
be38bef5-aad1-4384-b4cd-4ccae4a16b6d	forms	Username, password, otp and other auth forms.	dbdc26c7-3f31-4332-bae9-a245a94f1c51	basic-flow	f	t
adb890dc-3b39-43e3-832c-ed852fd2ebf8	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	dbdc26c7-3f31-4332-bae9-a245a94f1c51	basic-flow	f	t
03363fc4-835d-4a9e-86f5-f837478b5b04	direct grant	OpenID Connect Resource Owner Grant	dbdc26c7-3f31-4332-bae9-a245a94f1c51	basic-flow	t	t
2d8b88e4-3b21-4749-9aba-24f47ecaf4a7	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	dbdc26c7-3f31-4332-bae9-a245a94f1c51	basic-flow	f	t
2fbfd389-9233-4973-bd35-232e5bad05fb	registration	registration flow	dbdc26c7-3f31-4332-bae9-a245a94f1c51	basic-flow	t	t
7b6a8371-bd89-415c-ad0e-b44cda74e3ae	registration form	registration form	dbdc26c7-3f31-4332-bae9-a245a94f1c51	form-flow	f	t
1bc65055-8c96-48a8-82e8-1581ba7c3ea9	reset credentials	Reset credentials for a user if they forgot their password or something	dbdc26c7-3f31-4332-bae9-a245a94f1c51	basic-flow	t	t
e1ea0a1f-7ebc-479f-a25e-7adacef90920	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	dbdc26c7-3f31-4332-bae9-a245a94f1c51	basic-flow	f	t
b2f55077-8e56-4edf-ad3c-a88fa7dc9147	clients	Base authentication for clients	dbdc26c7-3f31-4332-bae9-a245a94f1c51	client-flow	t	t
0fa4f3f8-b603-4fcf-822a-03f1910dc183	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	dbdc26c7-3f31-4332-bae9-a245a94f1c51	basic-flow	t	t
4bf394e6-23e7-45cf-a4f6-defb5ece5742	User creation or linking	Flow for the existing/non-existing user alternatives	dbdc26c7-3f31-4332-bae9-a245a94f1c51	basic-flow	f	t
9d3d2599-1593-40c3-bcbe-33035b6b7d53	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	dbdc26c7-3f31-4332-bae9-a245a94f1c51	basic-flow	f	t
eff7887f-10a3-4a7b-9669-8a28f99ab50b	Account verification options	Method with which to verity the existing account	dbdc26c7-3f31-4332-bae9-a245a94f1c51	basic-flow	f	t
5a39ed0c-6108-47b8-9100-23e732c25a73	Verify Existing Account by Re-authentication	Reauthentication of existing account	dbdc26c7-3f31-4332-bae9-a245a94f1c51	basic-flow	f	t
4ce742df-9886-47c1-9048-f2b857e53982	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	dbdc26c7-3f31-4332-bae9-a245a94f1c51	basic-flow	f	t
7007af84-adcc-4770-a052-1f41fc6461db	saml ecp	SAML ECP Profile Authentication Flow	dbdc26c7-3f31-4332-bae9-a245a94f1c51	basic-flow	t	t
6d4ae779-fa2b-4510-be6e-7f9843be8284	docker auth	Used by Docker clients to authenticate against the IDP	dbdc26c7-3f31-4332-bae9-a245a94f1c51	basic-flow	t	t
8d144703-7546-4239-bc93-4ac2dff6e58a	browser	browser based authentication	e714c293-8916-447d-acec-a6202b90ae13	basic-flow	t	t
bfaa4f62-d076-44ef-8c9a-46023b93671b	forms	Username, password, otp and other auth forms.	e714c293-8916-447d-acec-a6202b90ae13	basic-flow	f	t
7d8619d0-ed7a-410d-b4d4-6dd7cc8ef604	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	e714c293-8916-447d-acec-a6202b90ae13	basic-flow	f	t
06d8f350-000f-45f2-885e-6d718a487fdc	direct grant	OpenID Connect Resource Owner Grant	e714c293-8916-447d-acec-a6202b90ae13	basic-flow	t	t
25816dac-8977-444b-abeb-391cdea1be3a	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	e714c293-8916-447d-acec-a6202b90ae13	basic-flow	f	t
d54dab90-8788-42b5-b1e9-674bab2dd267	registration	registration flow	e714c293-8916-447d-acec-a6202b90ae13	basic-flow	t	t
ebcbe12d-ac1a-41b2-8140-25727ea5640c	registration form	registration form	e714c293-8916-447d-acec-a6202b90ae13	form-flow	f	t
795368f4-bb8b-49cd-b18c-a286ab94ef02	reset credentials	Reset credentials for a user if they forgot their password or something	e714c293-8916-447d-acec-a6202b90ae13	basic-flow	t	t
d0ca43ab-3c27-436a-867a-930d434b634c	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	e714c293-8916-447d-acec-a6202b90ae13	basic-flow	f	t
02bff3de-ebce-4f17-86ee-926576ef70d6	clients	Base authentication for clients	e714c293-8916-447d-acec-a6202b90ae13	client-flow	t	t
b019c160-9fe8-4a17-bbcc-97a0ba696421	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	e714c293-8916-447d-acec-a6202b90ae13	basic-flow	t	t
bc00d366-5fc7-49d9-afc7-5d17ec8b8212	User creation or linking	Flow for the existing/non-existing user alternatives	e714c293-8916-447d-acec-a6202b90ae13	basic-flow	f	t
d5f3afd6-db6e-442f-8629-92f25a1ead01	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	e714c293-8916-447d-acec-a6202b90ae13	basic-flow	f	t
3f2719e8-5228-4170-a6a3-32f538189cfd	Account verification options	Method with which to verity the existing account	e714c293-8916-447d-acec-a6202b90ae13	basic-flow	f	t
b3788312-886d-42e0-957f-85cd036f6e7f	Verify Existing Account by Re-authentication	Reauthentication of existing account	e714c293-8916-447d-acec-a6202b90ae13	basic-flow	f	t
0b407638-d2bc-450f-acf1-25a7eb598f42	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	e714c293-8916-447d-acec-a6202b90ae13	basic-flow	f	t
bc999733-89a6-4f76-86d4-da684735e219	saml ecp	SAML ECP Profile Authentication Flow	e714c293-8916-447d-acec-a6202b90ae13	basic-flow	t	t
2a71158f-343d-4e18-8a5d-f523b10c60be	docker auth	Used by Docker clients to authenticate against the IDP	e714c293-8916-447d-acec-a6202b90ae13	basic-flow	t	t
\.


--
-- TOC entry 4193 (class 0 OID 17026)
-- Dependencies: 258
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.authenticator_config (id, alias, realm_id) FROM stdin;
ab7938ee-59b2-4947-a383-a5cdd4c66b3b	review profile config	dbdc26c7-3f31-4332-bae9-a245a94f1c51
6fa21960-3897-4558-86c7-e0661523b2e6	create unique user config	dbdc26c7-3f31-4332-bae9-a245a94f1c51
5399b674-c0a7-4a04-84cb-b9ec29776078	review profile config	e714c293-8916-447d-acec-a6202b90ae13
1ea2fb2c-3a97-434d-b24a-84fb4cf855d1	create unique user config	e714c293-8916-447d-acec-a6202b90ae13
\.


--
-- TOC entry 4196 (class 0 OID 17041)
-- Dependencies: 261
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
6fa21960-3897-4558-86c7-e0661523b2e6	false	require.password.update.after.registration
ab7938ee-59b2-4947-a383-a5cdd4c66b3b	missing	update.profile.on.first.login
1ea2fb2c-3a97-434d-b24a-84fb4cf855d1	false	require.password.update.after.registration
5399b674-c0a7-4a04-84cb-b9ec29776078	missing	update.profile.on.first.login
\.


--
-- TOC entry 4222 (class 0 OID 17479)
-- Dependencies: 287
-- Data for Name: broker_link; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- TOC entry 4153 (class 0 OID 16402)
-- Dependencies: 218
-- Data for Name: client; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
bc881421-2f5a-4038-8c43-e3301f49af4a	t	f	master-realm	0	f	\N	\N	t	\N	f	dbdc26c7-3f31-4332-bae9-a245a94f1c51	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
14dbf716-a258-4e80-b0c9-2d80be221444	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	dbdc26c7-3f31-4332-bae9-a245a94f1c51	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
b57ee92e-acfc-4b20-8b27-ef9367de2339	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	dbdc26c7-3f31-4332-bae9-a245a94f1c51	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
d70e91cc-f2f3-45a6-b55e-c83af55cfa39	t	f	broker	0	f	\N	\N	t	\N	f	dbdc26c7-3f31-4332-bae9-a245a94f1c51	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
d1230af8-b5d4-43e6-abaa-535e227f6242	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	dbdc26c7-3f31-4332-bae9-a245a94f1c51	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
4edff7b1-7412-419f-b047-d073e0efbf46	t	f	admin-cli	0	t	\N	\N	f	\N	f	dbdc26c7-3f31-4332-bae9-a245a94f1c51	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	t	f	secure-client-realm-realm	0	f	\N	\N	t	\N	f	dbdc26c7-3f31-4332-bae9-a245a94f1c51	\N	0	f	f	secure-client-realm Realm	f	client-secret	\N	\N	\N	t	f	f	f
a6689f74-8136-48a5-aaf2-d301d339aaff	t	f	realm-management	0	f	\N	\N	t	\N	f	e714c293-8916-447d-acec-a6202b90ae13	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
d2a19db5-9d31-4108-9e49-63cd169356d7	t	f	account	0	t	\N	/realms/secure-client-realm/account/	f	\N	f	e714c293-8916-447d-acec-a6202b90ae13	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
fa9559f2-8a34-402c-a370-5baa577d06e5	t	f	account-console	0	t	\N	/realms/secure-client-realm/account/	f	\N	f	e714c293-8916-447d-acec-a6202b90ae13	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
a4685d92-0a68-4301-a2bc-78bcb5f46aea	t	f	broker	0	f	\N	\N	t	\N	f	e714c293-8916-447d-acec-a6202b90ae13	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
f87a998e-f2d4-40f8-889a-e94ac271f609	t	f	security-admin-console	0	t	\N	/admin/secure-client-realm/console/	f	\N	f	e714c293-8916-447d-acec-a6202b90ae13	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
35749ab8-4b2b-4d71-b8b3-2bf8b346f836	t	t	auth-service	0	t	\N		f		f	e714c293-8916-447d-acec-a6202b90ae13	openid-connect	-1	t	f		f	client-secret			\N	t	f	t	f
ccb6b605-1a41-4064-b9ec-659b971d96d8	t	f	admin-cli	0	f	OqLClRwwwMtROz8VQftySuDVk7sj2mW1		f		f	e714c293-8916-447d-acec-a6202b90ae13	openid-connect	0	f	f	${client_admin-cli}	t	client-secret			\N	f	f	t	t
\.


--
-- TOC entry 4176 (class 0 OID 16760)
-- Dependencies: 241
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.client_attributes (client_id, name, value) FROM stdin;
14dbf716-a258-4e80-b0c9-2d80be221444	post.logout.redirect.uris	+
b57ee92e-acfc-4b20-8b27-ef9367de2339	post.logout.redirect.uris	+
b57ee92e-acfc-4b20-8b27-ef9367de2339	pkce.code.challenge.method	S256
d1230af8-b5d4-43e6-abaa-535e227f6242	post.logout.redirect.uris	+
d1230af8-b5d4-43e6-abaa-535e227f6242	pkce.code.challenge.method	S256
d2a19db5-9d31-4108-9e49-63cd169356d7	post.logout.redirect.uris	+
fa9559f2-8a34-402c-a370-5baa577d06e5	post.logout.redirect.uris	+
fa9559f2-8a34-402c-a370-5baa577d06e5	pkce.code.challenge.method	S256
f87a998e-f2d4-40f8-889a-e94ac271f609	post.logout.redirect.uris	+
f87a998e-f2d4-40f8-889a-e94ac271f609	pkce.code.challenge.method	S256
ccb6b605-1a41-4064-b9ec-659b971d96d8	backchannel.logout.url	http://localhost:8081/logout
ccb6b605-1a41-4064-b9ec-659b971d96d8	client.secret.creation.time	1724597894
ccb6b605-1a41-4064-b9ec-659b971d96d8	display.on.consent.screen	false
ccb6b605-1a41-4064-b9ec-659b971d96d8	oauth2.device.authorization.grant.enabled	false
ccb6b605-1a41-4064-b9ec-659b971d96d8	oidc.ciba.grant.enabled	false
ccb6b605-1a41-4064-b9ec-659b971d96d8	backchannel.logout.session.required	true
ccb6b605-1a41-4064-b9ec-659b971d96d8	backchannel.logout.revoke.offline.tokens	false
35749ab8-4b2b-4d71-b8b3-2bf8b346f836	oauth2.device.authorization.grant.enabled	false
35749ab8-4b2b-4d71-b8b3-2bf8b346f836	oidc.ciba.grant.enabled	false
35749ab8-4b2b-4d71-b8b3-2bf8b346f836	backchannel.logout.session.required	true
35749ab8-4b2b-4d71-b8b3-2bf8b346f836	backchannel.logout.revoke.offline.tokens	false
35749ab8-4b2b-4d71-b8b3-2bf8b346f836	display.on.consent.screen	false
35749ab8-4b2b-4d71-b8b3-2bf8b346f836	client.secret.creation.time	1724601438
\.


--
-- TOC entry 4233 (class 0 OID 17728)
-- Dependencies: 298
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- TOC entry 4232 (class 0 OID 17603)
-- Dependencies: 297
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- TOC entry 4178 (class 0 OID 16770)
-- Dependencies: 243
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- TOC entry 4210 (class 0 OID 17269)
-- Dependencies: 275
-- Data for Name: client_scope; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.client_scope (id, name, realm_id, description, protocol) FROM stdin;
a93412bc-2e8f-408f-b678-96b2db50aa7b	offline_access	dbdc26c7-3f31-4332-bae9-a245a94f1c51	OpenID Connect built-in scope: offline_access	openid-connect
9797765e-2d84-4757-808c-987ded6b9bd6	role_list	dbdc26c7-3f31-4332-bae9-a245a94f1c51	SAML role list	saml
9d0cab5c-afcc-4ea3-b101-4d42e4d415b2	profile	dbdc26c7-3f31-4332-bae9-a245a94f1c51	OpenID Connect built-in scope: profile	openid-connect
04c9d566-ca21-4661-8fbf-5799d55c26f6	email	dbdc26c7-3f31-4332-bae9-a245a94f1c51	OpenID Connect built-in scope: email	openid-connect
b8a91147-c5d1-4e67-a0ab-9330c21282bf	address	dbdc26c7-3f31-4332-bae9-a245a94f1c51	OpenID Connect built-in scope: address	openid-connect
58c267c8-9d53-4a9e-84d1-0b0b9e92dd13	phone	dbdc26c7-3f31-4332-bae9-a245a94f1c51	OpenID Connect built-in scope: phone	openid-connect
e04180aa-d199-4222-84a2-ab487af4f458	roles	dbdc26c7-3f31-4332-bae9-a245a94f1c51	OpenID Connect scope for add user roles to the access token	openid-connect
04f2206f-661d-43d4-b105-b87888d229dc	web-origins	dbdc26c7-3f31-4332-bae9-a245a94f1c51	OpenID Connect scope for add allowed web origins to the access token	openid-connect
f54d7cfb-b527-41b2-a361-be78068b8512	microprofile-jwt	dbdc26c7-3f31-4332-bae9-a245a94f1c51	Microprofile - JWT built-in scope	openid-connect
05cb7b86-5530-43d9-84a2-596f3b5c2cf0	acr	dbdc26c7-3f31-4332-bae9-a245a94f1c51	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
94fb7fee-6b5a-4df6-852f-46ee154e8983	offline_access	e714c293-8916-447d-acec-a6202b90ae13	OpenID Connect built-in scope: offline_access	openid-connect
f105853c-ec32-4b4b-ac69-b85293c78129	role_list	e714c293-8916-447d-acec-a6202b90ae13	SAML role list	saml
f8514664-5046-4036-9448-5ea49690ca37	profile	e714c293-8916-447d-acec-a6202b90ae13	OpenID Connect built-in scope: profile	openid-connect
4f6ddbd6-8190-490c-98b6-81fbbbd67b06	email	e714c293-8916-447d-acec-a6202b90ae13	OpenID Connect built-in scope: email	openid-connect
83ffa6b9-c992-40aa-83c8-4b70d71100a7	address	e714c293-8916-447d-acec-a6202b90ae13	OpenID Connect built-in scope: address	openid-connect
f9fff078-cc2c-414d-a768-1049b42ad6ee	phone	e714c293-8916-447d-acec-a6202b90ae13	OpenID Connect built-in scope: phone	openid-connect
2495d8ed-1b04-4f77-8425-5e74f89d364e	roles	e714c293-8916-447d-acec-a6202b90ae13	OpenID Connect scope for add user roles to the access token	openid-connect
851dc12f-6d81-402b-99a9-489735752570	web-origins	e714c293-8916-447d-acec-a6202b90ae13	OpenID Connect scope for add allowed web origins to the access token	openid-connect
f2fba91a-7d8d-435e-b1d6-75d49744cf4a	microprofile-jwt	e714c293-8916-447d-acec-a6202b90ae13	Microprofile - JWT built-in scope	openid-connect
30b18b0a-c2b0-42cb-8070-affa9097da22	acr	e714c293-8916-447d-acec-a6202b90ae13	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
\.


--
-- TOC entry 4211 (class 0 OID 17283)
-- Dependencies: 276
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.client_scope_attributes (scope_id, value, name) FROM stdin;
a93412bc-2e8f-408f-b678-96b2db50aa7b	true	display.on.consent.screen
a93412bc-2e8f-408f-b678-96b2db50aa7b	${offlineAccessScopeConsentText}	consent.screen.text
9797765e-2d84-4757-808c-987ded6b9bd6	true	display.on.consent.screen
9797765e-2d84-4757-808c-987ded6b9bd6	${samlRoleListScopeConsentText}	consent.screen.text
9d0cab5c-afcc-4ea3-b101-4d42e4d415b2	true	display.on.consent.screen
9d0cab5c-afcc-4ea3-b101-4d42e4d415b2	${profileScopeConsentText}	consent.screen.text
9d0cab5c-afcc-4ea3-b101-4d42e4d415b2	true	include.in.token.scope
04c9d566-ca21-4661-8fbf-5799d55c26f6	true	display.on.consent.screen
04c9d566-ca21-4661-8fbf-5799d55c26f6	${emailScopeConsentText}	consent.screen.text
04c9d566-ca21-4661-8fbf-5799d55c26f6	true	include.in.token.scope
b8a91147-c5d1-4e67-a0ab-9330c21282bf	true	display.on.consent.screen
b8a91147-c5d1-4e67-a0ab-9330c21282bf	${addressScopeConsentText}	consent.screen.text
b8a91147-c5d1-4e67-a0ab-9330c21282bf	true	include.in.token.scope
58c267c8-9d53-4a9e-84d1-0b0b9e92dd13	true	display.on.consent.screen
58c267c8-9d53-4a9e-84d1-0b0b9e92dd13	${phoneScopeConsentText}	consent.screen.text
58c267c8-9d53-4a9e-84d1-0b0b9e92dd13	true	include.in.token.scope
e04180aa-d199-4222-84a2-ab487af4f458	true	display.on.consent.screen
e04180aa-d199-4222-84a2-ab487af4f458	${rolesScopeConsentText}	consent.screen.text
e04180aa-d199-4222-84a2-ab487af4f458	false	include.in.token.scope
04f2206f-661d-43d4-b105-b87888d229dc	false	display.on.consent.screen
04f2206f-661d-43d4-b105-b87888d229dc		consent.screen.text
04f2206f-661d-43d4-b105-b87888d229dc	false	include.in.token.scope
f54d7cfb-b527-41b2-a361-be78068b8512	false	display.on.consent.screen
f54d7cfb-b527-41b2-a361-be78068b8512	true	include.in.token.scope
05cb7b86-5530-43d9-84a2-596f3b5c2cf0	false	display.on.consent.screen
05cb7b86-5530-43d9-84a2-596f3b5c2cf0	false	include.in.token.scope
94fb7fee-6b5a-4df6-852f-46ee154e8983	true	display.on.consent.screen
94fb7fee-6b5a-4df6-852f-46ee154e8983	${offlineAccessScopeConsentText}	consent.screen.text
f105853c-ec32-4b4b-ac69-b85293c78129	true	display.on.consent.screen
f105853c-ec32-4b4b-ac69-b85293c78129	${samlRoleListScopeConsentText}	consent.screen.text
f8514664-5046-4036-9448-5ea49690ca37	true	display.on.consent.screen
f8514664-5046-4036-9448-5ea49690ca37	${profileScopeConsentText}	consent.screen.text
f8514664-5046-4036-9448-5ea49690ca37	true	include.in.token.scope
4f6ddbd6-8190-490c-98b6-81fbbbd67b06	true	display.on.consent.screen
4f6ddbd6-8190-490c-98b6-81fbbbd67b06	${emailScopeConsentText}	consent.screen.text
4f6ddbd6-8190-490c-98b6-81fbbbd67b06	true	include.in.token.scope
83ffa6b9-c992-40aa-83c8-4b70d71100a7	true	display.on.consent.screen
83ffa6b9-c992-40aa-83c8-4b70d71100a7	${addressScopeConsentText}	consent.screen.text
83ffa6b9-c992-40aa-83c8-4b70d71100a7	true	include.in.token.scope
f9fff078-cc2c-414d-a768-1049b42ad6ee	true	display.on.consent.screen
f9fff078-cc2c-414d-a768-1049b42ad6ee	${phoneScopeConsentText}	consent.screen.text
f9fff078-cc2c-414d-a768-1049b42ad6ee	true	include.in.token.scope
2495d8ed-1b04-4f77-8425-5e74f89d364e	true	display.on.consent.screen
2495d8ed-1b04-4f77-8425-5e74f89d364e	${rolesScopeConsentText}	consent.screen.text
851dc12f-6d81-402b-99a9-489735752570	false	display.on.consent.screen
851dc12f-6d81-402b-99a9-489735752570		consent.screen.text
851dc12f-6d81-402b-99a9-489735752570	false	include.in.token.scope
f2fba91a-7d8d-435e-b1d6-75d49744cf4a	false	display.on.consent.screen
f2fba91a-7d8d-435e-b1d6-75d49744cf4a	true	include.in.token.scope
30b18b0a-c2b0-42cb-8070-affa9097da22	false	display.on.consent.screen
30b18b0a-c2b0-42cb-8070-affa9097da22	false	include.in.token.scope
2495d8ed-1b04-4f77-8425-5e74f89d364e		gui.order
2495d8ed-1b04-4f77-8425-5e74f89d364e	true	include.in.token.scope
\.


--
-- TOC entry 4234 (class 0 OID 17769)
-- Dependencies: 299
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
14dbf716-a258-4e80-b0c9-2d80be221444	9d0cab5c-afcc-4ea3-b101-4d42e4d415b2	t
14dbf716-a258-4e80-b0c9-2d80be221444	04f2206f-661d-43d4-b105-b87888d229dc	t
14dbf716-a258-4e80-b0c9-2d80be221444	05cb7b86-5530-43d9-84a2-596f3b5c2cf0	t
14dbf716-a258-4e80-b0c9-2d80be221444	e04180aa-d199-4222-84a2-ab487af4f458	t
14dbf716-a258-4e80-b0c9-2d80be221444	04c9d566-ca21-4661-8fbf-5799d55c26f6	t
14dbf716-a258-4e80-b0c9-2d80be221444	f54d7cfb-b527-41b2-a361-be78068b8512	f
14dbf716-a258-4e80-b0c9-2d80be221444	58c267c8-9d53-4a9e-84d1-0b0b9e92dd13	f
14dbf716-a258-4e80-b0c9-2d80be221444	a93412bc-2e8f-408f-b678-96b2db50aa7b	f
14dbf716-a258-4e80-b0c9-2d80be221444	b8a91147-c5d1-4e67-a0ab-9330c21282bf	f
b57ee92e-acfc-4b20-8b27-ef9367de2339	9d0cab5c-afcc-4ea3-b101-4d42e4d415b2	t
b57ee92e-acfc-4b20-8b27-ef9367de2339	04f2206f-661d-43d4-b105-b87888d229dc	t
b57ee92e-acfc-4b20-8b27-ef9367de2339	05cb7b86-5530-43d9-84a2-596f3b5c2cf0	t
b57ee92e-acfc-4b20-8b27-ef9367de2339	e04180aa-d199-4222-84a2-ab487af4f458	t
b57ee92e-acfc-4b20-8b27-ef9367de2339	04c9d566-ca21-4661-8fbf-5799d55c26f6	t
b57ee92e-acfc-4b20-8b27-ef9367de2339	f54d7cfb-b527-41b2-a361-be78068b8512	f
b57ee92e-acfc-4b20-8b27-ef9367de2339	58c267c8-9d53-4a9e-84d1-0b0b9e92dd13	f
b57ee92e-acfc-4b20-8b27-ef9367de2339	a93412bc-2e8f-408f-b678-96b2db50aa7b	f
b57ee92e-acfc-4b20-8b27-ef9367de2339	b8a91147-c5d1-4e67-a0ab-9330c21282bf	f
4edff7b1-7412-419f-b047-d073e0efbf46	9d0cab5c-afcc-4ea3-b101-4d42e4d415b2	t
4edff7b1-7412-419f-b047-d073e0efbf46	04f2206f-661d-43d4-b105-b87888d229dc	t
4edff7b1-7412-419f-b047-d073e0efbf46	05cb7b86-5530-43d9-84a2-596f3b5c2cf0	t
4edff7b1-7412-419f-b047-d073e0efbf46	e04180aa-d199-4222-84a2-ab487af4f458	t
4edff7b1-7412-419f-b047-d073e0efbf46	04c9d566-ca21-4661-8fbf-5799d55c26f6	t
4edff7b1-7412-419f-b047-d073e0efbf46	f54d7cfb-b527-41b2-a361-be78068b8512	f
4edff7b1-7412-419f-b047-d073e0efbf46	58c267c8-9d53-4a9e-84d1-0b0b9e92dd13	f
4edff7b1-7412-419f-b047-d073e0efbf46	a93412bc-2e8f-408f-b678-96b2db50aa7b	f
4edff7b1-7412-419f-b047-d073e0efbf46	b8a91147-c5d1-4e67-a0ab-9330c21282bf	f
d70e91cc-f2f3-45a6-b55e-c83af55cfa39	9d0cab5c-afcc-4ea3-b101-4d42e4d415b2	t
d70e91cc-f2f3-45a6-b55e-c83af55cfa39	04f2206f-661d-43d4-b105-b87888d229dc	t
d70e91cc-f2f3-45a6-b55e-c83af55cfa39	05cb7b86-5530-43d9-84a2-596f3b5c2cf0	t
d70e91cc-f2f3-45a6-b55e-c83af55cfa39	e04180aa-d199-4222-84a2-ab487af4f458	t
d70e91cc-f2f3-45a6-b55e-c83af55cfa39	04c9d566-ca21-4661-8fbf-5799d55c26f6	t
d70e91cc-f2f3-45a6-b55e-c83af55cfa39	f54d7cfb-b527-41b2-a361-be78068b8512	f
d70e91cc-f2f3-45a6-b55e-c83af55cfa39	58c267c8-9d53-4a9e-84d1-0b0b9e92dd13	f
d70e91cc-f2f3-45a6-b55e-c83af55cfa39	a93412bc-2e8f-408f-b678-96b2db50aa7b	f
d70e91cc-f2f3-45a6-b55e-c83af55cfa39	b8a91147-c5d1-4e67-a0ab-9330c21282bf	f
bc881421-2f5a-4038-8c43-e3301f49af4a	9d0cab5c-afcc-4ea3-b101-4d42e4d415b2	t
bc881421-2f5a-4038-8c43-e3301f49af4a	04f2206f-661d-43d4-b105-b87888d229dc	t
bc881421-2f5a-4038-8c43-e3301f49af4a	05cb7b86-5530-43d9-84a2-596f3b5c2cf0	t
bc881421-2f5a-4038-8c43-e3301f49af4a	e04180aa-d199-4222-84a2-ab487af4f458	t
bc881421-2f5a-4038-8c43-e3301f49af4a	04c9d566-ca21-4661-8fbf-5799d55c26f6	t
bc881421-2f5a-4038-8c43-e3301f49af4a	f54d7cfb-b527-41b2-a361-be78068b8512	f
bc881421-2f5a-4038-8c43-e3301f49af4a	58c267c8-9d53-4a9e-84d1-0b0b9e92dd13	f
bc881421-2f5a-4038-8c43-e3301f49af4a	a93412bc-2e8f-408f-b678-96b2db50aa7b	f
bc881421-2f5a-4038-8c43-e3301f49af4a	b8a91147-c5d1-4e67-a0ab-9330c21282bf	f
d1230af8-b5d4-43e6-abaa-535e227f6242	9d0cab5c-afcc-4ea3-b101-4d42e4d415b2	t
d1230af8-b5d4-43e6-abaa-535e227f6242	04f2206f-661d-43d4-b105-b87888d229dc	t
d1230af8-b5d4-43e6-abaa-535e227f6242	05cb7b86-5530-43d9-84a2-596f3b5c2cf0	t
d1230af8-b5d4-43e6-abaa-535e227f6242	e04180aa-d199-4222-84a2-ab487af4f458	t
d1230af8-b5d4-43e6-abaa-535e227f6242	04c9d566-ca21-4661-8fbf-5799d55c26f6	t
d1230af8-b5d4-43e6-abaa-535e227f6242	f54d7cfb-b527-41b2-a361-be78068b8512	f
d1230af8-b5d4-43e6-abaa-535e227f6242	58c267c8-9d53-4a9e-84d1-0b0b9e92dd13	f
d1230af8-b5d4-43e6-abaa-535e227f6242	a93412bc-2e8f-408f-b678-96b2db50aa7b	f
d1230af8-b5d4-43e6-abaa-535e227f6242	b8a91147-c5d1-4e67-a0ab-9330c21282bf	f
d2a19db5-9d31-4108-9e49-63cd169356d7	f8514664-5046-4036-9448-5ea49690ca37	t
d2a19db5-9d31-4108-9e49-63cd169356d7	4f6ddbd6-8190-490c-98b6-81fbbbd67b06	t
d2a19db5-9d31-4108-9e49-63cd169356d7	851dc12f-6d81-402b-99a9-489735752570	t
d2a19db5-9d31-4108-9e49-63cd169356d7	2495d8ed-1b04-4f77-8425-5e74f89d364e	t
d2a19db5-9d31-4108-9e49-63cd169356d7	30b18b0a-c2b0-42cb-8070-affa9097da22	t
d2a19db5-9d31-4108-9e49-63cd169356d7	83ffa6b9-c992-40aa-83c8-4b70d71100a7	f
d2a19db5-9d31-4108-9e49-63cd169356d7	94fb7fee-6b5a-4df6-852f-46ee154e8983	f
d2a19db5-9d31-4108-9e49-63cd169356d7	f9fff078-cc2c-414d-a768-1049b42ad6ee	f
d2a19db5-9d31-4108-9e49-63cd169356d7	f2fba91a-7d8d-435e-b1d6-75d49744cf4a	f
fa9559f2-8a34-402c-a370-5baa577d06e5	f8514664-5046-4036-9448-5ea49690ca37	t
fa9559f2-8a34-402c-a370-5baa577d06e5	4f6ddbd6-8190-490c-98b6-81fbbbd67b06	t
fa9559f2-8a34-402c-a370-5baa577d06e5	851dc12f-6d81-402b-99a9-489735752570	t
fa9559f2-8a34-402c-a370-5baa577d06e5	2495d8ed-1b04-4f77-8425-5e74f89d364e	t
fa9559f2-8a34-402c-a370-5baa577d06e5	30b18b0a-c2b0-42cb-8070-affa9097da22	t
fa9559f2-8a34-402c-a370-5baa577d06e5	83ffa6b9-c992-40aa-83c8-4b70d71100a7	f
fa9559f2-8a34-402c-a370-5baa577d06e5	94fb7fee-6b5a-4df6-852f-46ee154e8983	f
fa9559f2-8a34-402c-a370-5baa577d06e5	f9fff078-cc2c-414d-a768-1049b42ad6ee	f
fa9559f2-8a34-402c-a370-5baa577d06e5	f2fba91a-7d8d-435e-b1d6-75d49744cf4a	f
ccb6b605-1a41-4064-b9ec-659b971d96d8	f8514664-5046-4036-9448-5ea49690ca37	t
ccb6b605-1a41-4064-b9ec-659b971d96d8	4f6ddbd6-8190-490c-98b6-81fbbbd67b06	t
ccb6b605-1a41-4064-b9ec-659b971d96d8	851dc12f-6d81-402b-99a9-489735752570	t
ccb6b605-1a41-4064-b9ec-659b971d96d8	2495d8ed-1b04-4f77-8425-5e74f89d364e	t
ccb6b605-1a41-4064-b9ec-659b971d96d8	30b18b0a-c2b0-42cb-8070-affa9097da22	t
ccb6b605-1a41-4064-b9ec-659b971d96d8	83ffa6b9-c992-40aa-83c8-4b70d71100a7	f
ccb6b605-1a41-4064-b9ec-659b971d96d8	94fb7fee-6b5a-4df6-852f-46ee154e8983	f
ccb6b605-1a41-4064-b9ec-659b971d96d8	f9fff078-cc2c-414d-a768-1049b42ad6ee	f
ccb6b605-1a41-4064-b9ec-659b971d96d8	f2fba91a-7d8d-435e-b1d6-75d49744cf4a	f
a4685d92-0a68-4301-a2bc-78bcb5f46aea	f8514664-5046-4036-9448-5ea49690ca37	t
a4685d92-0a68-4301-a2bc-78bcb5f46aea	4f6ddbd6-8190-490c-98b6-81fbbbd67b06	t
a4685d92-0a68-4301-a2bc-78bcb5f46aea	851dc12f-6d81-402b-99a9-489735752570	t
a4685d92-0a68-4301-a2bc-78bcb5f46aea	2495d8ed-1b04-4f77-8425-5e74f89d364e	t
a4685d92-0a68-4301-a2bc-78bcb5f46aea	30b18b0a-c2b0-42cb-8070-affa9097da22	t
a4685d92-0a68-4301-a2bc-78bcb5f46aea	83ffa6b9-c992-40aa-83c8-4b70d71100a7	f
a4685d92-0a68-4301-a2bc-78bcb5f46aea	94fb7fee-6b5a-4df6-852f-46ee154e8983	f
a4685d92-0a68-4301-a2bc-78bcb5f46aea	f9fff078-cc2c-414d-a768-1049b42ad6ee	f
a4685d92-0a68-4301-a2bc-78bcb5f46aea	f2fba91a-7d8d-435e-b1d6-75d49744cf4a	f
a6689f74-8136-48a5-aaf2-d301d339aaff	f8514664-5046-4036-9448-5ea49690ca37	t
a6689f74-8136-48a5-aaf2-d301d339aaff	4f6ddbd6-8190-490c-98b6-81fbbbd67b06	t
a6689f74-8136-48a5-aaf2-d301d339aaff	851dc12f-6d81-402b-99a9-489735752570	t
a6689f74-8136-48a5-aaf2-d301d339aaff	2495d8ed-1b04-4f77-8425-5e74f89d364e	t
a6689f74-8136-48a5-aaf2-d301d339aaff	30b18b0a-c2b0-42cb-8070-affa9097da22	t
a6689f74-8136-48a5-aaf2-d301d339aaff	83ffa6b9-c992-40aa-83c8-4b70d71100a7	f
a6689f74-8136-48a5-aaf2-d301d339aaff	94fb7fee-6b5a-4df6-852f-46ee154e8983	f
a6689f74-8136-48a5-aaf2-d301d339aaff	f9fff078-cc2c-414d-a768-1049b42ad6ee	f
a6689f74-8136-48a5-aaf2-d301d339aaff	f2fba91a-7d8d-435e-b1d6-75d49744cf4a	f
f87a998e-f2d4-40f8-889a-e94ac271f609	f8514664-5046-4036-9448-5ea49690ca37	t
f87a998e-f2d4-40f8-889a-e94ac271f609	4f6ddbd6-8190-490c-98b6-81fbbbd67b06	t
f87a998e-f2d4-40f8-889a-e94ac271f609	851dc12f-6d81-402b-99a9-489735752570	t
f87a998e-f2d4-40f8-889a-e94ac271f609	2495d8ed-1b04-4f77-8425-5e74f89d364e	t
f87a998e-f2d4-40f8-889a-e94ac271f609	30b18b0a-c2b0-42cb-8070-affa9097da22	t
f87a998e-f2d4-40f8-889a-e94ac271f609	83ffa6b9-c992-40aa-83c8-4b70d71100a7	f
f87a998e-f2d4-40f8-889a-e94ac271f609	94fb7fee-6b5a-4df6-852f-46ee154e8983	f
f87a998e-f2d4-40f8-889a-e94ac271f609	f9fff078-cc2c-414d-a768-1049b42ad6ee	f
f87a998e-f2d4-40f8-889a-e94ac271f609	f2fba91a-7d8d-435e-b1d6-75d49744cf4a	f
35749ab8-4b2b-4d71-b8b3-2bf8b346f836	f8514664-5046-4036-9448-5ea49690ca37	t
35749ab8-4b2b-4d71-b8b3-2bf8b346f836	4f6ddbd6-8190-490c-98b6-81fbbbd67b06	t
35749ab8-4b2b-4d71-b8b3-2bf8b346f836	851dc12f-6d81-402b-99a9-489735752570	t
35749ab8-4b2b-4d71-b8b3-2bf8b346f836	2495d8ed-1b04-4f77-8425-5e74f89d364e	t
35749ab8-4b2b-4d71-b8b3-2bf8b346f836	30b18b0a-c2b0-42cb-8070-affa9097da22	t
35749ab8-4b2b-4d71-b8b3-2bf8b346f836	83ffa6b9-c992-40aa-83c8-4b70d71100a7	f
35749ab8-4b2b-4d71-b8b3-2bf8b346f836	94fb7fee-6b5a-4df6-852f-46ee154e8983	f
35749ab8-4b2b-4d71-b8b3-2bf8b346f836	f9fff078-cc2c-414d-a768-1049b42ad6ee	f
35749ab8-4b2b-4d71-b8b3-2bf8b346f836	f2fba91a-7d8d-435e-b1d6-75d49744cf4a	f
\.


--
-- TOC entry 4212 (class 0 OID 17288)
-- Dependencies: 277
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.client_scope_role_mapping (scope_id, role_id) FROM stdin;
a93412bc-2e8f-408f-b678-96b2db50aa7b	80d9948f-be08-4ede-a0ed-5a8bb99ee6ad
94fb7fee-6b5a-4df6-852f-46ee154e8983	845a5fea-62a0-4ea4-83a1-4486495c3c6a
\.


--
-- TOC entry 4154 (class 0 OID 16413)
-- Dependencies: 219
-- Data for Name: client_session; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- TOC entry 4199 (class 0 OID 17059)
-- Dependencies: 264
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- TOC entry 4177 (class 0 OID 16765)
-- Dependencies: 242
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- TOC entry 4191 (class 0 OID 16943)
-- Dependencies: 256
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- TOC entry 4155 (class 0 OID 16418)
-- Dependencies: 220
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- TOC entry 4200 (class 0 OID 17140)
-- Dependencies: 265
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- TOC entry 4230 (class 0 OID 17524)
-- Dependencies: 295
-- Data for Name: component; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
15610c59-a11a-48ef-9d3e-d19769ac67fe	Trusted Hosts	dbdc26c7-3f31-4332-bae9-a245a94f1c51	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	dbdc26c7-3f31-4332-bae9-a245a94f1c51	anonymous
fa8d6bcd-9c23-48c5-b8b4-e7430eb0e541	Consent Required	dbdc26c7-3f31-4332-bae9-a245a94f1c51	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	dbdc26c7-3f31-4332-bae9-a245a94f1c51	anonymous
88ea11ef-68f7-4274-8ce0-0f83ce261ffc	Full Scope Disabled	dbdc26c7-3f31-4332-bae9-a245a94f1c51	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	dbdc26c7-3f31-4332-bae9-a245a94f1c51	anonymous
c611dff3-614b-4003-b132-ab5247cda6de	Max Clients Limit	dbdc26c7-3f31-4332-bae9-a245a94f1c51	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	dbdc26c7-3f31-4332-bae9-a245a94f1c51	anonymous
317fc1cf-631f-41c7-afa2-18ff25f2ae82	Allowed Protocol Mapper Types	dbdc26c7-3f31-4332-bae9-a245a94f1c51	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	dbdc26c7-3f31-4332-bae9-a245a94f1c51	anonymous
426ee3a4-a7af-4f95-b003-d1c4dc668ea7	Allowed Client Scopes	dbdc26c7-3f31-4332-bae9-a245a94f1c51	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	dbdc26c7-3f31-4332-bae9-a245a94f1c51	anonymous
c0bda499-692f-4ce7-8f18-39c825b728a4	Allowed Protocol Mapper Types	dbdc26c7-3f31-4332-bae9-a245a94f1c51	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	dbdc26c7-3f31-4332-bae9-a245a94f1c51	authenticated
0ce6a033-a6e0-459e-a798-67ad1566acb6	Allowed Client Scopes	dbdc26c7-3f31-4332-bae9-a245a94f1c51	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	dbdc26c7-3f31-4332-bae9-a245a94f1c51	authenticated
e48f270c-838a-4c79-9c9d-555289962987	rsa-generated	dbdc26c7-3f31-4332-bae9-a245a94f1c51	rsa-generated	org.keycloak.keys.KeyProvider	dbdc26c7-3f31-4332-bae9-a245a94f1c51	\N
cdb1f123-e175-45b1-930f-6bf2399002ff	rsa-enc-generated	dbdc26c7-3f31-4332-bae9-a245a94f1c51	rsa-enc-generated	org.keycloak.keys.KeyProvider	dbdc26c7-3f31-4332-bae9-a245a94f1c51	\N
898098db-9776-4123-95c1-33ea37bb5150	hmac-generated	dbdc26c7-3f31-4332-bae9-a245a94f1c51	hmac-generated	org.keycloak.keys.KeyProvider	dbdc26c7-3f31-4332-bae9-a245a94f1c51	\N
0582e347-34e6-4ebe-9917-5c421792bb62	aes-generated	dbdc26c7-3f31-4332-bae9-a245a94f1c51	aes-generated	org.keycloak.keys.KeyProvider	dbdc26c7-3f31-4332-bae9-a245a94f1c51	\N
fd58c7db-6abc-4e19-8434-4f64ac02cb60	rsa-generated	e714c293-8916-447d-acec-a6202b90ae13	rsa-generated	org.keycloak.keys.KeyProvider	e714c293-8916-447d-acec-a6202b90ae13	\N
e70dd65a-0e5a-448e-bdfb-781c621dc628	rsa-enc-generated	e714c293-8916-447d-acec-a6202b90ae13	rsa-enc-generated	org.keycloak.keys.KeyProvider	e714c293-8916-447d-acec-a6202b90ae13	\N
8c4008c9-1c8b-40cc-a139-419bcc3a212f	hmac-generated	e714c293-8916-447d-acec-a6202b90ae13	hmac-generated	org.keycloak.keys.KeyProvider	e714c293-8916-447d-acec-a6202b90ae13	\N
7465f7be-1d1d-48bc-8636-dbc679692617	aes-generated	e714c293-8916-447d-acec-a6202b90ae13	aes-generated	org.keycloak.keys.KeyProvider	e714c293-8916-447d-acec-a6202b90ae13	\N
f99551e7-9ed3-4caa-8f61-8b198b7b660e	Trusted Hosts	e714c293-8916-447d-acec-a6202b90ae13	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e714c293-8916-447d-acec-a6202b90ae13	anonymous
92f3d2b3-2375-4f68-b99e-f02520dfbc32	Consent Required	e714c293-8916-447d-acec-a6202b90ae13	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e714c293-8916-447d-acec-a6202b90ae13	anonymous
f860c8a8-7fa9-472e-aa00-c24cd1a0519c	Full Scope Disabled	e714c293-8916-447d-acec-a6202b90ae13	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e714c293-8916-447d-acec-a6202b90ae13	anonymous
1f1b22d1-66f8-4552-a66d-1758225fda2e	Max Clients Limit	e714c293-8916-447d-acec-a6202b90ae13	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e714c293-8916-447d-acec-a6202b90ae13	anonymous
f1bc7f3f-7545-455b-a374-cde2fff4ddcc	Allowed Protocol Mapper Types	e714c293-8916-447d-acec-a6202b90ae13	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e714c293-8916-447d-acec-a6202b90ae13	anonymous
be946508-95fe-43eb-be17-b2e763138651	Allowed Client Scopes	e714c293-8916-447d-acec-a6202b90ae13	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e714c293-8916-447d-acec-a6202b90ae13	anonymous
407fced0-ee38-49d0-bdff-f0154cc94649	Allowed Protocol Mapper Types	e714c293-8916-447d-acec-a6202b90ae13	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e714c293-8916-447d-acec-a6202b90ae13	authenticated
d8b9158e-20ea-4c1f-8976-c10f2036d8f6	Allowed Client Scopes	e714c293-8916-447d-acec-a6202b90ae13	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e714c293-8916-447d-acec-a6202b90ae13	authenticated
\.


--
-- TOC entry 4229 (class 0 OID 17519)
-- Dependencies: 294
-- Data for Name: component_config; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.component_config (id, component_id, name, value) FROM stdin;
55500559-2f13-45b1-be25-1e03a8a174e2	c611dff3-614b-4003-b132-ab5247cda6de	max-clients	200
bb9fc595-388c-4d33-899c-cc60b25d48d1	426ee3a4-a7af-4f95-b003-d1c4dc668ea7	allow-default-scopes	true
6798f484-45fc-4aef-8aff-29d2009fb234	15610c59-a11a-48ef-9d3e-d19769ac67fe	host-sending-registration-request-must-match	true
b3d84edc-6b53-49a4-ad42-3eb0410e9d6c	15610c59-a11a-48ef-9d3e-d19769ac67fe	client-uris-must-match	true
fe3118a8-5873-4658-bbd7-19913f71be85	0ce6a033-a6e0-459e-a798-67ad1566acb6	allow-default-scopes	true
fae0bb95-63dd-4e75-800f-d6807717963a	317fc1cf-631f-41c7-afa2-18ff25f2ae82	allowed-protocol-mapper-types	oidc-address-mapper
ec869724-eda5-4cf4-bc91-0c509ba01440	317fc1cf-631f-41c7-afa2-18ff25f2ae82	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
d14a67ca-14c1-46a2-99ea-4d1c4ee65756	317fc1cf-631f-41c7-afa2-18ff25f2ae82	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
c54d54eb-cec0-4ec6-8500-ff4d7aaad8ce	317fc1cf-631f-41c7-afa2-18ff25f2ae82	allowed-protocol-mapper-types	saml-user-property-mapper
148b0e0d-d92d-4b7b-a5b9-d75302480b74	317fc1cf-631f-41c7-afa2-18ff25f2ae82	allowed-protocol-mapper-types	saml-user-attribute-mapper
f8c230a6-d74b-4629-9cd5-70a56f997310	317fc1cf-631f-41c7-afa2-18ff25f2ae82	allowed-protocol-mapper-types	saml-role-list-mapper
ec3114d6-608a-4cd6-83cf-8992f9b69f0a	317fc1cf-631f-41c7-afa2-18ff25f2ae82	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
2f2c51ae-5bdc-4b53-9c15-e4fc8b88af39	317fc1cf-631f-41c7-afa2-18ff25f2ae82	allowed-protocol-mapper-types	oidc-full-name-mapper
56c9982a-f838-488f-997e-984312dfc294	c0bda499-692f-4ce7-8f18-39c825b728a4	allowed-protocol-mapper-types	saml-role-list-mapper
26ea831b-4d0d-47b7-8617-38fa1e2aa241	c0bda499-692f-4ce7-8f18-39c825b728a4	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
24f71ad1-9236-4c7c-b0db-7c732e1e416a	c0bda499-692f-4ce7-8f18-39c825b728a4	allowed-protocol-mapper-types	saml-user-attribute-mapper
3f29d6a2-0751-448b-b0de-734b4875b8cf	c0bda499-692f-4ce7-8f18-39c825b728a4	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
89d69922-4967-446b-8db2-c8b9cc8c11fa	c0bda499-692f-4ce7-8f18-39c825b728a4	allowed-protocol-mapper-types	saml-user-property-mapper
7c1d446d-b42e-4fde-aae5-779690b973be	c0bda499-692f-4ce7-8f18-39c825b728a4	allowed-protocol-mapper-types	oidc-full-name-mapper
49ed1c2f-c5cb-4a16-8eff-1b7f7c6c4159	c0bda499-692f-4ce7-8f18-39c825b728a4	allowed-protocol-mapper-types	oidc-address-mapper
4ea3bd66-2293-435a-bdb4-f99859231781	c0bda499-692f-4ce7-8f18-39c825b728a4	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
1888fec1-9217-4a30-8513-d73220846477	898098db-9776-4123-95c1-33ea37bb5150	secret	wlk3atcuzgpSEP4p7_vm83M8uUBxLkt0E6Unq2WIaWDb30Y6pLfhsk_NfSUVIjZw-EDYKDIz6YOZdw8g38fS8w
e9f0cf2b-6394-4ef0-ba48-33ab3f4410b3	898098db-9776-4123-95c1-33ea37bb5150	priority	100
dbdf574f-f5ce-4e01-878c-6ea5d73c06ff	898098db-9776-4123-95c1-33ea37bb5150	algorithm	HS256
1f6b98d7-143a-43d2-a5a0-70d1ad9dda41	898098db-9776-4123-95c1-33ea37bb5150	kid	4adb2aa2-07b3-4229-8f10-abd3f2d37c44
802e2f65-641c-4084-91c4-147f56fc8b2e	e48f270c-838a-4c79-9c9d-555289962987	privateKey	MIIEowIBAAKCAQEAoEw94XpDuC0+AtsDF2eljbDMPM9d3JLTSfHRmeZODxgPVvheP/L+66nKll7jzOyIG5qgC6mMdM/3rzjegupSh/sdyzm9k1TySdy+QxdcDVhGU4KwmiLtzXJkxlCeefnB1gY3Ddpca0ifr01d93hW3CYHFX0z3UJsnc7pAjJP0SwG6WmPk/3RPYpYpDC6CBiAGPE2E5yA+ye9SqKCHyTsm8A0zK7xPyK1yfMNG6IXKvj1SIMcrsQUmotZNF9q0J9Ca4fx2HxWUEHwqPYlgVJBDRtwKrRFIFDWzERFa2b3BNF2CnQh2+gTW+t8zK9QC+BzXHWLloZnfE0fy4PKgjWrdwIDAQABAoIBABNQbGpVGYDBDsY4TlyNFAEJCurOz4/qrwOrW+ZvvfsKmpqPjYemBzos+Kh6oXcJDvNIg70z/iT7A+x8bS8X/b69rp7Ug7eTVig5LUGXOHOxLbQVPKMtzzpgbK0KfLXUtprLn+mO5HDWzMrKBybwvIKFIHhh4BRqUv0Gt8OYfU6GDxLHxGj86+fqnjHnSXsretM4hfY04EoRI5wRXEGDJEAoyw54JmnzN+eu1GKNGtvhWWfMAWPBzhJV+Xzm2/rglqv0Z7HHJdT4LyTpg3w1FEDCxQCib51Kb7bseXq8lrkjDFvJmG9Rxmz2E1Ekkn/2g1iOll84a5rdz/zSVdb7HQUCgYEA2ehU8kZpTOyz+80zDD29mOm8hVM11kKzoV7vnpXbibtd4h3SkQ9aOVTqMThM82f9s5XD5/tvpYquAZXi2Wux4T1g9cqpkS81migTP2SceYZ+/rK7XDzn4WwVsvA5qX7Yi2zOavWkZzSuaIPG8Lwp+N4axllVgIhKSbYCbaUPV1UCgYEAvFHLOhdhXMkYsG6/MbTcvjdIfidSX1jiJq1fl8KPFFjN+xwTP9hT1F2anU5hwPbDxxl0XAyXJHGwUUCvmZa0f4YBphaET7wLge0Y5ZHvx28KnLP7j171cqpFOGWdp1WDQBQodG0bLDPNE8qa7xL9pTQyggHi7EK6ZliaYqP2n5sCgYAM/ZfK1b3DUz0rnsETUr7x1cViYWKNQm65CRLZ7m8nF99x8nsyIKstTc2kX4ne3O03/o6uTsQKJ2lWONxMP+pb1i/ol0til2Dnrsnu9o2JhSYfAwK+bfcY7jug7kdRvnkkXrkzkS9a474eBvUeNul9p6gK+RpqzjU3jb05UiTG/QKBgCyB5FchaXhlarlgIz3bMgSeyjpOjtBMEH71oM8cQ3aammwLsZz4Qq/BQ6aD/OR/LbwjjvWmYB5T5Ej/0cCp9pThFgir769skQevAqBXQmVPICHzA7RZzAbCqUNv+LewpSmC2iDSHIbw4zoXO1DfmyTtVjaVvYz7JFTGAg7oE4SbAoGBAJzrIyKQTWCoIfFzfYPW7pZeqy7FYF3jwuy4d2GmhZxDeNah3zINkU8zdfQmsUXjuM8FtCNjOhIBfVKF+9V4+UozTYWUZ+ZriWTyqW4bS/dcszsSDV/Prqlyx8MK1PVH/Q1VbEmdxMiMK0RbUpArnacYLWdewHKFWL5ORRdPauX2
0fc7551d-965e-4dc3-a569-26cbd660acfd	e48f270c-838a-4c79-9c9d-555289962987	keyUse	SIG
3a237746-bb61-4399-9bf1-5ca6d8677a35	e48f270c-838a-4c79-9c9d-555289962987	priority	100
0137fa44-2773-4f5e-a4fb-291e1371c7ad	e48f270c-838a-4c79-9c9d-555289962987	certificate	MIICmzCCAYMCBgGRiez18TANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwODI1MTQyMzEzWhcNMzQwODI1MTQyNDUzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCgTD3hekO4LT4C2wMXZ6WNsMw8z13cktNJ8dGZ5k4PGA9W+F4/8v7rqcqWXuPM7IgbmqALqYx0z/evON6C6lKH+x3LOb2TVPJJ3L5DF1wNWEZTgrCaIu3NcmTGUJ55+cHWBjcN2lxrSJ+vTV33eFbcJgcVfTPdQmydzukCMk/RLAbpaY+T/dE9ilikMLoIGIAY8TYTnID7J71KooIfJOybwDTMrvE/IrXJ8w0bohcq+PVIgxyuxBSai1k0X2rQn0Jrh/HYfFZQQfCo9iWBUkENG3AqtEUgUNbMREVrZvcE0XYKdCHb6BNb63zMr1AL4HNcdYuWhmd8TR/Lg8qCNat3AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAIe/Z8v0pBt2jLF29N5IDOBDhs308OeaTJr+bXyRw2r31arGOpfQ0J8rxWRFppUOjWPYE2Kavtn10azKnycwo2R+gBoVX4jCXvPYzF8Hl0Xrj8pffHC0aTOu1f/da72aw7hx5fXHbN7bwNjFE7vCf96DbswLoyiRnAlwHveYQcU59l8L7/qAeWfk3ckJaAXio46p/uqllCQiMBn1T37HOjRe+pjh5Sv9l+5v0TxyW3TKzW5bWR0a9bQZQrEsroCaHMFRniMkzenHonBG9kxKfVIDpQuuz0oailg/xLMJMDwk9NP/Itl7eIxNKhmv8gf/YooXk5twOsQkZ1gt6DHFAys=
af33fcfb-e6f7-40fe-90c9-2bd51a0ae7cd	cdb1f123-e175-45b1-930f-6bf2399002ff	keyUse	ENC
2d36a2f0-181e-40a8-8823-b94668725728	cdb1f123-e175-45b1-930f-6bf2399002ff	privateKey	MIIEpAIBAAKCAQEAqDZHmQ5EOX6WH3UulSrZPs/qA8XfCS1VxV3Kyu7T7TbqwVH5h47K5VO4ofVPyGiQP6FuhQT/7CqpJD6EIlR+iNvTE026vCtB5UGMzW8XkrshCCmjJdTVgZudvJvSquevfrvnpmRvt3t6w+HADJ/SQ3zSTTv8nMC3jXbyp8BapDpqo0XqlVZwgeLAm1bXBqEqUdWSmGF5pKux/+TW5jg1cWkFFFbOq2fa3JJIU2xKPyiEYd/hrvQ3tGEpoJNFSDSmgFxbTHhcd6OkpzqajdJmyu4h+aG92nLEgtOLQh2UlIGV09rKmUoW0WWvhgxGd6W90cgjZndqie7IFLO2GQNhNQIDAQABAoIBAChkHkWfkhzPK2ui1vxtFUzannno89EvkGKrzqPzfLJ/hxfEIBufm1M9Sv6i2dVI3GhXEmOBC5XxOXuxQke/C8I/rLu8JKyF45UR7CYxOJMceYZM/za4mEr+q73sGcY9i1uucaW4BMZlcVljVhsB7nqTmKkAkDwwn3Kp3wMOcoVv+Ln2bZBDK0vklsjflHzKo2HsY+Vq5YsbXQqUtCr7YsPl2wJcEX2NJF5kpG4XMlpFHZXqgKc/b13pAxElJ+5lbgE/odghHD2egt8sPXSv8lhWDKa7MrI3iCun33XbZ+ryhKzp1ZH3Wf0ZN3DFt3nm/sdMKVRFx9sw4IX06n1A2lECgYEA2t+Ppqe8zMt0na5//ePzktr3RYNRkVcL/BinTtz3Rm91/gPhzGbTfS77VPryPvSykHhbz8F8g2ezayGzfy2+/XWt1Qizsoz+U94VkZjki+cWUcq6+ryGY1JRe7zcKeCbvYU4bf8mWxIJe8teemnEJrm4mPfM+ImczaRZ97I3BgUCgYEAxL7I0GmYuCwYlPpw8ypxoFIxTCubwMGpnXpySZPZX7Bkv4YWU06s8IR6H4M3ynsniGgofG+dktK+DYV0bz7VEEcFMm/zsABC6aVTVrm3aSZtoWBpEC2bEU7lM7M658Agye6GV0ksNJvdaEL/0Iag2q1g33XXlPcIG4Fts3NfJXECgYEAp665HmPJyFhjKl7DHh8iv7LT2ESoHCJFQ0kb/NZa93JzQj11IyTwCCsTUGLFbqgHmZksNbm1i/LJyVzTaK8CcKpUmC6HhVZxjo1Jlvc8uVY8ikM4BtqiVrt9Q8BIKCk1B/hlaBgfKYxjCZ2f70bSiRymKUNHnG3JXN76MkMt1oUCgYEAwFK/evu+jkqMvRUT1KBo8o9mIU9/sa2eYJKRpdshYqjL02z/5e/CnlriBmv+3bAFtRIcgYeaQSxBHHaYmyaQoJjMO8G0NRgMUNmL3fstj1xBTr8v9OCf9Qtqgl9x9Zmac8r3B9w/mi3DAWh9KRpxo1JYoBhR5QyWoEylMAZXvAECgYAEe+S52QeqB+JSpUO4UrYqIyOf2Q92bH8wNQ4J9MZFP+OujEiiIOD9LnPAkDNJf3QvpJFcJqkgC5L/J1+NdmmvnAZ5VsjYmxM1xoRpfR+A+4cOvUTTaGk6K5+TC/tUWmAgrN82dCbVufFm4okvQg/PegPByHmiNb8M69u8Nw5gXA==
e68ed51f-ff3a-4155-b404-630519c4b9e9	cdb1f123-e175-45b1-930f-6bf2399002ff	certificate	MIICmzCCAYMCBgGRiez59zANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwODI1MTQyMzE0WhcNMzQwODI1MTQyNDU0WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCoNkeZDkQ5fpYfdS6VKtk+z+oDxd8JLVXFXcrK7tPtNurBUfmHjsrlU7ih9U/IaJA/oW6FBP/sKqkkPoQiVH6I29MTTbq8K0HlQYzNbxeSuyEIKaMl1NWBm528m9Kq569+u+emZG+3e3rD4cAMn9JDfNJNO/ycwLeNdvKnwFqkOmqjReqVVnCB4sCbVtcGoSpR1ZKYYXmkq7H/5NbmODVxaQUUVs6rZ9rckkhTbEo/KIRh3+Gu9De0YSmgk0VINKaAXFtMeFx3o6SnOpqN0mbK7iH5ob3acsSC04tCHZSUgZXT2sqZShbRZa+GDEZ3pb3RyCNmd2qJ7sgUs7YZA2E1AgMBAAEwDQYJKoZIhvcNAQELBQADggEBACd+K8f+lf9/HKMyiXD+u6an6Y68GuT1stnhR/Fho7IXgANAH5EhAwmwR+b/63VHLtcfBo+Updr/vzvFQoZN7tSSpHysj8+BIcOTpkshpLSLViEk8VAbSPiy98bo2o1xjNv5bvKrRUe5gooAS6+vlFPxaskKgqoovhNTW3aFNv7vjmKZD01Hj0F6j5G7sPDJTqtY9INikqgg2k/f3gSK7gr200nnrez3ZySjAhJtQiYPKpHaZ+Y2Qf8BvJiSZ7rR+ZsF8LuX9+X92uzEzqhQj14Em4BmDwOIB5MbjQjVfKZB85f7NZFBTEGwEfh5axI1CR9fwDvtIxEi3DOxUmjmbEA=
8456163f-5e97-43ae-b9b7-e0d4869e37e3	cdb1f123-e175-45b1-930f-6bf2399002ff	algorithm	RSA-OAEP
19013ec7-9647-4664-94a4-2a1e605beebd	cdb1f123-e175-45b1-930f-6bf2399002ff	priority	100
e1829ef4-15bd-4437-8034-bef3d59e5fc0	0582e347-34e6-4ebe-9917-5c421792bb62	priority	100
2f139b1b-46a1-485a-b808-19ddb968892b	0582e347-34e6-4ebe-9917-5c421792bb62	kid	de01864e-030e-42d8-8dfe-dd740f8d47b6
889038cf-ad98-40ca-ad89-5e9a1b2201e0	0582e347-34e6-4ebe-9917-5c421792bb62	secret	Jfr4nyWKGBFc3jlrt3sgxg
a8bf4458-7626-497b-a019-2d170ca78217	7465f7be-1d1d-48bc-8636-dbc679692617	secret	o6YCN5DSvPvWtCIMdINR_g
f63a4b15-e0ca-4975-854c-79dfebb6fc88	7465f7be-1d1d-48bc-8636-dbc679692617	kid	0619bd00-0e2f-4e71-b38e-e0ed5beacdf0
83b8c7f7-04cc-41bf-a5fd-07b72c2dd33c	7465f7be-1d1d-48bc-8636-dbc679692617	priority	100
3ceddee3-b9db-47cd-811f-aada6083ff00	fd58c7db-6abc-4e19-8434-4f64ac02cb60	keyUse	SIG
1090dbe7-51fe-466e-ac39-9e5f2984c399	fd58c7db-6abc-4e19-8434-4f64ac02cb60	certificate	MIICtTCCAZ0CBgGRifIW/zANBgkqhkiG9w0BAQsFADAeMRwwGgYDVQQDDBNzZWN1cmUtY2xpZW50LXJlYWxtMB4XDTI0MDgyNTE0Mjg0OVoXDTM0MDgyNTE0MzAyOVowHjEcMBoGA1UEAwwTc2VjdXJlLWNsaWVudC1yZWFsbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOZCcsdgY1SCnij7/G3WPKSjCkEKJyVduGEFI4dDoTO6RAXLXcKU+UKR+JtxrocOG/Q89CyJhhx74s3szAegUGeG76zNYzY1gYAy71pBK0vp9LPQLJybqbMZ7/uwzULUczNo3IE5cvcsV/5cutEovlstvdfrpdstulDA3QmvbTlCiDssgUWXzYYOlh+Y5fA0V4xhvUdURk9SnaW7d6zwWQtSbjK5ttpqU6Y/uUrG8g8jov+gTm8sVZ41Sql3vnzII/eJHSVDXAgMI107ecjnJLlUMsue2x5+m79vjIsvYEMWWx8iMGhxyiBBvTSgbYv2M4L85DNuTU+C9dNCv1ztuxsCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAz330UNJgk0L1LvMRBaZF/AYQuqDZMLXLLYS10hatmlrhEaU5iUpVJzkX/Uhr8uvIxRdQY5uZE+WvkPL8b2AVxBvGl/voH3Y4GlCUp/cWqlj6b1idMR1mhSkF1/LaCdEQFxITr1+eQmFrI6xBDqMcv7mzbew5EzvmcmBH+gncFw/WYfzp4fyAzuUP8z/A+N4RWhtEUdxibE9qOkRGkUEI6FEXeqLJORSNsHwup+BEYcEFYn3TrXwBSmDZKEIrRWv0Ejhf9mAkkkkFNLIdTYZI7NIPOgX5tDiw8uPLV5EMSNW/byMYN4gdmqv5PhPD1MxK70MeF8WbMyAzuf/3x/KK9w==
3a5a6f29-92a2-49a7-83ee-de2a3ff1369a	fd58c7db-6abc-4e19-8434-4f64ac02cb60	privateKey	MIIEowIBAAKCAQEA5kJyx2BjVIKeKPv8bdY8pKMKQQonJV24YQUjh0OhM7pEBctdwpT5QpH4m3Guhw4b9Dz0LImGHHvizezMB6BQZ4bvrM1jNjWBgDLvWkErS+n0s9AsnJupsxnv+7DNQtRzM2jcgTly9yxX/ly60Si+Wy291+ul2y26UMDdCa9tOUKIOyyBRZfNhg6WH5jl8DRXjGG9R1RGT1Kdpbt3rPBZC1JuMrm22mpTpj+5SsbyDyOi/6BObyxVnjVKqXe+fMgj94kdJUNcCAwjXTt5yOckuVQyy57bHn6bv2+Miy9gQxZbHyIwaHHKIEG9NKBti/YzgvzkM25NT4L100K/XO27GwIDAQABAoIBAHFkc8W/r+rkUCL6xPsKL98b82bIKzL5jl0o/LAWHAKvTeRUnB3A42dnHzjdqQcVaarDgbOVHhhU4gJrBKcUycPR7aH5m0wM2XNaogieY0YFNt5+PBn7hnyO32HhVZP9r6W3lC+HLRiQG91FqTJrkCKyyfTVNV5UjJZMBA5K98zkCaCoz+Ff2j/jB/Jdf/EoEcv0SWLIZR2eFnyn9wPq0X2zbxEbuEHQJXj9+T9t7dzRGCEV1qwfY7aqFpYoGKfxJTOMutot8tAh+1xbo52WMWT2uM6dBK66HxBYjjkuAe9VLexni6vnpF9QXCia+xCBTymwlr7I9eBNaLSlwjaNIqECgYEA+T3nTGnxCzaFuGIIL2TnqDQ85l3IC+PR0dy0CO8CptSZPa0KxxaYjWzKtW5ghnAUyfUE2RviR+ATmwFiZGqx/SJOuC1CssFyeKcCU3QBk/7tuXzW6eXr5kOTqGltYPM+DXXNHTqErAQKHZua0QnAakAt0hP3KLbBtWELP9xMXmMCgYEA7IDH4BQVFNaPa11agLY6VqG4oqGjIwk7HqtsRI9eVh5A5r/h+gRR5iJU31Sb/9GDqfylpR/XX3l1CtuStDn0alhkv6APqS4RZc+hM/cPzce1myrJYCk97rfQCT2AnLy6S1UtWbdAe0nqhxyXGq4uvsA/r+GQ1nCXrfzdqxg/0ekCgYBIEHsBIBye1lvhjQ66zV0hyEDXhsQhk/SFzl+Lube1jwDj0VWtbL4dHhiaTti/5kZMgnitYZ+Skpp4lfTh/euKulGydPu0/bPgaMGGaaNPLEWF/S+Sn3UOtflKl3kVsB7/+1CcI+BacCyQlP41dLFax0W4WSd8cSMfE3kSNNsr6wKBgQCl5EdPZIbNERuUwezDsA8HyXSLjzmxT75KaxAMn0wauCnqMdo+11zjQl2qMd0i+kGSsQc35jfaXoW80fv7s1NAbTRuPcX+c7P8aEG5A6nwPA+lAcQzUXqBwimI8b0PNEqwoNSow6PVVynNED7llhxv7MY/hsdjw6KBhoeuhdnuUQKBgGB/vpEJdh+DnEEtLvUAU9lWztQ4tUdOu52NDYK4gWmBnCMtDgd0pGLQN3xo8vL42wwcGQDWRnRs65HrcIYub1wXZQoyobnoft8A3AeSOoS6ME3a/9L7BGU09E1WlQBqcUAMZIF7GRZJ0Pm+nNabvDZBUyTeqdhafzSAN7bMZlsW
d20e2ce6-53af-4828-b17d-c914b525c32d	fd58c7db-6abc-4e19-8434-4f64ac02cb60	priority	100
bf7e35bd-1754-4769-888e-3fd25192676d	e70dd65a-0e5a-448e-bdfb-781c621dc628	certificate	MIICtTCCAZ0CBgGRifIX8zANBgkqhkiG9w0BAQsFADAeMRwwGgYDVQQDDBNzZWN1cmUtY2xpZW50LXJlYWxtMB4XDTI0MDgyNTE0Mjg1MFoXDTM0MDgyNTE0MzAzMFowHjEcMBoGA1UEAwwTc2VjdXJlLWNsaWVudC1yZWFsbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALNKauO8Uw5azptH/VLzjrQ0DY13bb/TAl/GtZaYdhgtPpMqaumb3XkeXXpMEOdplIS/sTX1MTp6CldYq0mQyyhx9xmILdqk63Uu/21Fzf9pLQX9DPMcGTDA97q1FxVB/16Wdb+7tH65Q+Hoqw1iS+DNXldexhhOdlV8jgW8RJnrt6yIGHzmmALklTpjbbzyz0eq9m7lUwkFFMr7B+iN/ajmNNASBmweuKeSJCx6ijtVEY4LTry4pT+BsVgZ1qPz4h8rKW3291bqbcJPQZD30gxU2MxvoblAhgqgEOaar5UW1VlZfPFC+KpnCpe1zTSy5UMtfpqEcc3OaWc9AJYugUcCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAJMJ9fxFkiELrx8Ia2gDo7jGLaBYUsCjd/ZH0mXP31f5VDBcs/mWnnorKZeXImiavHaSvelGkUS+97FsuKCoUG7Q1UGZiC4WrlqHRMj2FY+7sbXHHlictC8kH0eVYucuEyKYA9ieuxg1X0HW0tRoIJer9xtOyBYcqVTN6r8tMsAcnwCDif8XwGCnHEnFMOvhwdrod+TXq4zDUvfEFGgZjlPNXy/7r57Jq5YZj0bzwLLBfiwMuzu2ww9s/NsUJ9XUyfRW5EXLfy7AX0IjItudgdYWr5/VJoKLZt4afqb7AdNkYR2jDkIlu77LvpsHbz6RrH87Z6j5ggs6Sr1jMt9GAyw==
2e808be9-ec5f-4af1-8c0f-0458bb3a8bf3	e70dd65a-0e5a-448e-bdfb-781c621dc628	keyUse	ENC
3f39a3b1-c27b-410d-b50b-65cfddddf555	e70dd65a-0e5a-448e-bdfb-781c621dc628	priority	100
54f40d69-c017-4997-91c6-97e5608d8bc4	e70dd65a-0e5a-448e-bdfb-781c621dc628	algorithm	RSA-OAEP
f2f0e7f3-870b-4da2-8d08-53cd58c8d876	e70dd65a-0e5a-448e-bdfb-781c621dc628	privateKey	MIIEowIBAAKCAQEAs0pq47xTDlrOm0f9UvOOtDQNjXdtv9MCX8a1lph2GC0+kypq6ZvdeR5dekwQ52mUhL+xNfUxOnoKV1irSZDLKHH3GYgt2qTrdS7/bUXN/2ktBf0M8xwZMMD3urUXFUH/XpZ1v7u0frlD4eirDWJL4M1eV17GGE52VXyOBbxEmeu3rIgYfOaYAuSVOmNtvPLPR6r2buVTCQUUyvsH6I39qOY00BIGbB64p5IkLHqKO1URjgtOvLilP4GxWBnWo/PiHyspbfb3Vuptwk9BkPfSDFTYzG+huUCGCqAQ5pqvlRbVWVl88UL4qmcKl7XNNLLlQy1+moRxzc5pZz0Ali6BRwIDAQABAoIBAAdA0imYnRzEp3zlTcYun6ecC+JQIkRmfNjM33X4tAP1X9JkHtAiY84HE8DWiMAiTgWMaPBl+3hb2itypSqEOfVoauObCUCod457+MExPj/mphFXpxyP44r/4eXC3R/mIoOI/1MWFmhVn8pPXdnCqY9hVfKfg5176x8GCD7XwRS5Wm+hBdA2QCKpX0JQJ4a7dBQlxhadUY+XefEM3zrA+E1FHVpeqO95u90VsM4wvLFwzFrWOq0L6PuIMvZh6LhqEC9LJvmQ1YM1/myoDJnm2MNS3Yrh2/+PQSC526kfi9+giKzMp4l2V+YTTA332rL8t3mwFnO8dlE8PjqzrBXlri0CgYEA5o+p9/RzeBwpV/4ipEhoCHAzCa2Jp/GYeEDaNjhyh/NWBTnYZVidxVzy0g/iHu4zpCOQXgpvEAB8Gt+CGmr3jixTdOvT+isaPjeNh2icOudDdl1gk87hDAmj6/wvVih1eUaa/Q65O3o0IkqE0SbSPx5ewrnH+Lw1L7GWOAAXb1MCgYEAxxKWofQw2ndmsUJL1EVWbrRzuJ2wgVH48/gEiigMuEzihG60DXUTsWjFjGKkmLRK0lLau4ti3kl7DJcd8FABnBIdF/WvU3z80gDCyKLdKbD5s9X/VjwEFk+uBY5VMxgQxChmHjJ6nz6MK8JaHuquYqaBdLkgnbZO60XAi8csS70CgYBC8OtUhrEP6n1Ggw7jy/IIoSrwYGZbUJYINCwnGfSG7GvJUKY3pqcIKpiFzP7GJDryKTE9XKIqbzmZQ9Ouf+goa04/4EjHlcQk1FRPQFw77fF0aGAmCiblK9dgKPRFe7G/6HQPjTrSvgRtAF3XrAHXOaYhu3cIDP0UP+dxkvU66QKBgQCuTrBmjpJYOERK4WnULAJKXOcWt7xc/5GkzX3sGrVIismse+JcBi+AH+UZzyWgL/1zu+iaXqnrSRvdIlSsnuFJ7vJakF08FSyqFNB5LWHJp5R8ytwQfex2PL57Tu17F49Wsqj3t+t2lCXYCw0uFP8ske64bYEJlx/zEdhOi89VYQKBgGxlWPkjtfnLQqVwWajWCY2DKSRWSxbRswP5Tz0TzMynIUJZEAbLgQUd00D3LtfucY3IBHDn327uUNh9AevuJf8KYgMdOp6dFncx3OPOzxi7mAgFBvxqFZbk4XIRCFm5Mkxr1Ejjtrvp4q03DhsTQvce9HvYCrG4O+ij6oqJeeGV
42828d43-9bc5-4ed9-9336-ef6011bc9154	8c4008c9-1c8b-40cc-a139-419bcc3a212f	secret	ueRmJt0FmA-kmchWiE25eDVuyRpf7JiHfInpCQ19ndgXFGm4sh4Omi4coggvytijeLEQd_XWNTClp-gWG8hs-Q
555d4d2d-20b5-45eb-91cc-f3ff5b0fb19e	8c4008c9-1c8b-40cc-a139-419bcc3a212f	algorithm	HS256
552ee3f6-2a46-49b2-b013-230aa89543e2	8c4008c9-1c8b-40cc-a139-419bcc3a212f	kid	d198cc11-4e5c-4e87-a869-0842a026cd04
9a49ea84-88a3-4497-9b31-076730de1fec	8c4008c9-1c8b-40cc-a139-419bcc3a212f	priority	100
5f29e0c7-0461-4d14-8ed3-77e0adf00639	f99551e7-9ed3-4caa-8f61-8b198b7b660e	host-sending-registration-request-must-match	true
f9743878-e07e-4cbf-8980-f2d969e8d736	f99551e7-9ed3-4caa-8f61-8b198b7b660e	client-uris-must-match	true
9719def5-4a36-4a0e-aa94-c2d1a6b649c0	1f1b22d1-66f8-4552-a66d-1758225fda2e	max-clients	200
091fd2d2-9a28-49d7-a64f-d96d1230d8d0	be946508-95fe-43eb-be17-b2e763138651	allow-default-scopes	true
19b1668a-2123-412a-a93b-28eced900195	d8b9158e-20ea-4c1f-8976-c10f2036d8f6	allow-default-scopes	true
742735f2-1d8e-4a67-a1f6-ac106dacd7fa	407fced0-ee38-49d0-bdff-f0154cc94649	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
4efa2d70-cd5d-46ce-822b-d3fa1824875f	407fced0-ee38-49d0-bdff-f0154cc94649	allowed-protocol-mapper-types	oidc-full-name-mapper
2b16d17a-f8b5-4543-97cb-18b54464a603	407fced0-ee38-49d0-bdff-f0154cc94649	allowed-protocol-mapper-types	saml-user-property-mapper
6da0fd7a-5912-4366-83ce-3441d7e92b10	407fced0-ee38-49d0-bdff-f0154cc94649	allowed-protocol-mapper-types	oidc-address-mapper
1be57e62-aed9-429d-8ef5-69f04b76ec0b	407fced0-ee38-49d0-bdff-f0154cc94649	allowed-protocol-mapper-types	saml-role-list-mapper
2ff6018c-0df4-4ba3-9cf3-81f805048c69	407fced0-ee38-49d0-bdff-f0154cc94649	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
d52fd1e5-d5c5-48ff-9212-4fe979a41299	407fced0-ee38-49d0-bdff-f0154cc94649	allowed-protocol-mapper-types	saml-user-attribute-mapper
e906a1e2-9e8b-4bec-86f0-58256add9f29	407fced0-ee38-49d0-bdff-f0154cc94649	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
3a4fbbba-b8d2-47ab-9e2e-e3d231a7537b	f1bc7f3f-7545-455b-a374-cde2fff4ddcc	allowed-protocol-mapper-types	oidc-address-mapper
4a6f54ca-a04b-4745-a4e2-8bea350864eb	f1bc7f3f-7545-455b-a374-cde2fff4ddcc	allowed-protocol-mapper-types	saml-role-list-mapper
8571ae6a-f46b-4467-9fc2-1a9d8dc08545	f1bc7f3f-7545-455b-a374-cde2fff4ddcc	allowed-protocol-mapper-types	oidc-full-name-mapper
aa65ebd3-4fb8-48b9-95ea-1b8c7243cbbc	f1bc7f3f-7545-455b-a374-cde2fff4ddcc	allowed-protocol-mapper-types	saml-user-property-mapper
0daafbbc-75ed-4005-82ea-2b008f619b2c	f1bc7f3f-7545-455b-a374-cde2fff4ddcc	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
6272efce-551d-4c87-919e-6068078b92d5	f1bc7f3f-7545-455b-a374-cde2fff4ddcc	allowed-protocol-mapper-types	saml-user-attribute-mapper
50bf5a2c-7161-4bd9-84c3-6a758490b5d8	f1bc7f3f-7545-455b-a374-cde2fff4ddcc	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
eb2ccfac-ef84-4173-a593-750d8fe53cb1	f1bc7f3f-7545-455b-a374-cde2fff4ddcc	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
\.


--
-- TOC entry 4156 (class 0 OID 16421)
-- Dependencies: 221
-- Data for Name: composite_role; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.composite_role (composite, child_role) FROM stdin;
e3f0d47e-a0df-426e-aaf7-713831196bb5	339534d1-f21a-4855-95c7-a111d825252d
e3f0d47e-a0df-426e-aaf7-713831196bb5	133f6950-cca1-4c41-9132-baa7f35aa445
e3f0d47e-a0df-426e-aaf7-713831196bb5	3367e8be-5ec4-4e3e-8181-67008d85ea12
e3f0d47e-a0df-426e-aaf7-713831196bb5	632757f2-8e95-4f7d-8d86-fdaa5a246268
e3f0d47e-a0df-426e-aaf7-713831196bb5	e04eef66-5ad0-4daa-a0ed-8611d27e8a1c
e3f0d47e-a0df-426e-aaf7-713831196bb5	ed0d3805-38de-47d0-82cb-62142cb54e2a
e3f0d47e-a0df-426e-aaf7-713831196bb5	17d8ae96-efe7-4417-9d85-6acfedcbc4b5
e3f0d47e-a0df-426e-aaf7-713831196bb5	97d694ed-cea0-495f-89d8-974278af532f
e3f0d47e-a0df-426e-aaf7-713831196bb5	df69a38a-5a70-4729-bdd7-bddb71f8e08e
e3f0d47e-a0df-426e-aaf7-713831196bb5	c24ebe59-24c8-4316-9e8d-b2ae6d59f843
e3f0d47e-a0df-426e-aaf7-713831196bb5	11e5af1d-5e51-4cc8-a836-bb804b9e4c87
e3f0d47e-a0df-426e-aaf7-713831196bb5	f1662fe5-391b-4a1e-a772-eecb7e554af3
e3f0d47e-a0df-426e-aaf7-713831196bb5	9cb80070-6855-4d9c-a43a-df21fe4f4f18
e3f0d47e-a0df-426e-aaf7-713831196bb5	86b05a8e-57c1-4925-bf9e-caa8184713fd
e3f0d47e-a0df-426e-aaf7-713831196bb5	20989f5f-3445-495f-9d77-77da7e5aebd2
e3f0d47e-a0df-426e-aaf7-713831196bb5	9d928eb6-fdce-4b99-893b-488f6def90fc
e3f0d47e-a0df-426e-aaf7-713831196bb5	6abbb1f8-5672-42a7-bcb4-bb7caa6280b8
e3f0d47e-a0df-426e-aaf7-713831196bb5	843c2cb1-221e-427f-9439-0d7c5e023edd
632757f2-8e95-4f7d-8d86-fdaa5a246268	20989f5f-3445-495f-9d77-77da7e5aebd2
632757f2-8e95-4f7d-8d86-fdaa5a246268	843c2cb1-221e-427f-9439-0d7c5e023edd
91b63f58-c8c6-4f40-97e7-718f9692e901	d270dac7-5931-42c1-bf34-9a65980827f7
e04eef66-5ad0-4daa-a0ed-8611d27e8a1c	9d928eb6-fdce-4b99-893b-488f6def90fc
91b63f58-c8c6-4f40-97e7-718f9692e901	fd730af9-7011-41e6-a59f-43e8b39db0a7
fd730af9-7011-41e6-a59f-43e8b39db0a7	fa8b4fd6-4e7a-4f0b-9603-8b607f8cf411
ffec91b2-2746-4dd8-bf01-d59d85e91528	92da983b-f40b-43ba-9362-8cf9bd5a80fc
e3f0d47e-a0df-426e-aaf7-713831196bb5	1bed019d-a68d-4a3b-901a-c3e229db0fc0
91b63f58-c8c6-4f40-97e7-718f9692e901	80d9948f-be08-4ede-a0ed-5a8bb99ee6ad
91b63f58-c8c6-4f40-97e7-718f9692e901	d8793888-f0cd-434f-ae9a-994ccd1c8af5
e3f0d47e-a0df-426e-aaf7-713831196bb5	18838fae-d334-4235-b9cd-fa4c188ec1c8
e3f0d47e-a0df-426e-aaf7-713831196bb5	b99cce9d-ca3b-4357-8e6a-d97f584ea873
e3f0d47e-a0df-426e-aaf7-713831196bb5	a81a7d02-db4e-470c-bd60-8036ed528846
e3f0d47e-a0df-426e-aaf7-713831196bb5	d539c9d4-84ac-4c53-a7ee-deae15a969cd
e3f0d47e-a0df-426e-aaf7-713831196bb5	e6064096-506e-4c2c-aca7-0e2e4715766d
e3f0d47e-a0df-426e-aaf7-713831196bb5	cdfefad0-9b50-4a7e-80b7-348263fc7e4d
e3f0d47e-a0df-426e-aaf7-713831196bb5	176bd3ec-50fb-4b3d-ae6a-7a0bcdacab98
e3f0d47e-a0df-426e-aaf7-713831196bb5	0d355637-4957-45f0-8dee-fd97bd43c383
e3f0d47e-a0df-426e-aaf7-713831196bb5	7aaaf853-8da5-4620-80e4-44786aefb7c6
e3f0d47e-a0df-426e-aaf7-713831196bb5	6f203878-864b-43ef-89a7-21d6b2b7a5ac
e3f0d47e-a0df-426e-aaf7-713831196bb5	faa39396-7e3b-464d-a618-eab6b67eda86
e3f0d47e-a0df-426e-aaf7-713831196bb5	30faaa38-c37b-4a45-b354-009923fdf34c
e3f0d47e-a0df-426e-aaf7-713831196bb5	6c0fa72c-105f-42dd-a02a-7c4932f1587d
e3f0d47e-a0df-426e-aaf7-713831196bb5	841d466a-6a27-45fd-a59c-7f1fc1626ae6
e3f0d47e-a0df-426e-aaf7-713831196bb5	3dad17aa-b43d-4bba-bf83-e52772e04f2d
e3f0d47e-a0df-426e-aaf7-713831196bb5	5f7ceb33-c1b8-4cb4-b98c-57332b9bdef0
e3f0d47e-a0df-426e-aaf7-713831196bb5	dccacab0-ea9b-4835-9aa1-9c7fcda8d763
a81a7d02-db4e-470c-bd60-8036ed528846	dccacab0-ea9b-4835-9aa1-9c7fcda8d763
a81a7d02-db4e-470c-bd60-8036ed528846	841d466a-6a27-45fd-a59c-7f1fc1626ae6
d539c9d4-84ac-4c53-a7ee-deae15a969cd	3dad17aa-b43d-4bba-bf83-e52772e04f2d
d6341ca2-a6b3-4275-8227-ab5722eb5953	4040561a-b90e-4856-847c-95cf8e54ae90
d6341ca2-a6b3-4275-8227-ab5722eb5953	591e5843-83f3-4f80-a829-357806949255
d6341ca2-a6b3-4275-8227-ab5722eb5953	47021daa-d96e-4104-a536-521a84b2ab28
d6341ca2-a6b3-4275-8227-ab5722eb5953	ac1e0677-80f4-4807-bf5e-b7270c3c5acc
d6341ca2-a6b3-4275-8227-ab5722eb5953	a8cab8de-e3f6-4cb8-8eda-d1ef13aacb1d
d6341ca2-a6b3-4275-8227-ab5722eb5953	e765f517-2fea-4e67-8ea0-0bdd48460b14
d6341ca2-a6b3-4275-8227-ab5722eb5953	f7966ada-bb79-4fc5-bbd6-749eb170ed67
d6341ca2-a6b3-4275-8227-ab5722eb5953	c87e1fc9-47f6-4b21-b2fc-5f4de477aa6a
d6341ca2-a6b3-4275-8227-ab5722eb5953	327532a4-d84d-4fe8-9f24-1239be56c6bf
d6341ca2-a6b3-4275-8227-ab5722eb5953	c0eccde8-6b4b-4069-8aa5-e8d88fdf9b75
d6341ca2-a6b3-4275-8227-ab5722eb5953	79f6db28-5304-4e4d-9bc5-18fa06e054b0
d6341ca2-a6b3-4275-8227-ab5722eb5953	95bef6ff-305a-48df-840d-dceff3995f2e
d6341ca2-a6b3-4275-8227-ab5722eb5953	2989a6df-8869-4a5d-9e58-d8332a8fae38
d6341ca2-a6b3-4275-8227-ab5722eb5953	8d552f84-4187-4e83-ad83-97ec713f4c18
d6341ca2-a6b3-4275-8227-ab5722eb5953	b638d61b-0316-4af5-aabd-ee4fd548b39d
d6341ca2-a6b3-4275-8227-ab5722eb5953	b95187e4-39e0-4444-8003-f686473e8b3d
d6341ca2-a6b3-4275-8227-ab5722eb5953	2308c7e0-7e5b-4090-ac39-3575a2cf5ea2
47021daa-d96e-4104-a536-521a84b2ab28	2308c7e0-7e5b-4090-ac39-3575a2cf5ea2
47021daa-d96e-4104-a536-521a84b2ab28	8d552f84-4187-4e83-ad83-97ec713f4c18
ac1e0677-80f4-4807-bf5e-b7270c3c5acc	b638d61b-0316-4af5-aabd-ee4fd548b39d
c346a324-63f8-4d17-8afd-57237cbbb385	787af660-a649-48e0-835a-7df228db5a91
c346a324-63f8-4d17-8afd-57237cbbb385	11489bfc-ac3b-40ee-a5c9-c41b693a2c04
11489bfc-ac3b-40ee-a5c9-c41b693a2c04	30c56810-7337-4e91-ba9a-20717e4362cc
7448957d-21fb-44b6-9f02-e33147b3fe31	033ff238-c488-418b-b245-ee870b0a9064
e3f0d47e-a0df-426e-aaf7-713831196bb5	59dd90f8-8d32-41b4-85d1-59559c6dbe0b
d6341ca2-a6b3-4275-8227-ab5722eb5953	8cd91570-e63f-4d7c-bff1-8355428d1757
c346a324-63f8-4d17-8afd-57237cbbb385	845a5fea-62a0-4ea4-83a1-4486495c3c6a
c346a324-63f8-4d17-8afd-57237cbbb385	5b8bba39-b219-410f-af7a-22cefc7cf42f
\.


--
-- TOC entry 4157 (class 0 OID 16424)
-- Dependencies: 222
-- Data for Name: credential; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
c8ce5248-ce13-4a51-bf49-643ac28d8d92	\N	password	24e4c721-a324-458d-bd5e-c33efb6f7e02	1724595897086	\N	{"value":"q3NUhKYDj+1t6JvfZ0h8ivjO/ZZgE47/jS4zftt4qpQ=","salt":"15Ap91upihyLRIC7daQj7g==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
d8870830-b315-478e-bc25-d61235241ec5	\N	password	3d30ddc4-c7d7-45af-886f-131c330119ee	1724604076474	My password	{"value":"EzobizYbIFPTfRZaKbwN0khIfUIMPdwZZa5/n8qCGHg=","salt":"RzcOiNwJPzmG+0zQ9EmRGA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
2282c281-60b1-40bc-8ed8-828f8209ec41	\N	password	904ce2b0-ac88-4db7-950f-b4e9825c5261	1724606517207	\N	{"value":"L5XaWlw59ecr9az/XQZHYwBg/O5NUkdnJHMU8zyOkhQ=","salt":"kE+LXouMAPCY+C17mlWsMA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
9d60fec2-2bd0-42ab-87a0-7cc58b0275ce	\N	password	43668f21-1ede-4e46-a026-88bd1675a317	1724949398587	\N	{"value":"D3oDrqbzZEJ5IS3NiAxFBGpMpJ5FwUuwo3AEnoQyG5k=","salt":"LNC12anIOAX9y3PIuS93tQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- TOC entry 4152 (class 0 OID 16394)
-- Dependencies: 217
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2024-08-25 14:24:31.577049	1	EXECUTED	8:bda77d94bf90182a1e30c24f1c155ec7	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.20.0	\N	\N	4595866228
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2024-08-25 14:24:31.597961	2	MARK_RAN	8:1ecb330f30986693d1cba9ab579fa219	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.20.0	\N	\N	4595866228
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2024-08-25 14:24:31.942438	3	EXECUTED	8:cb7ace19bc6d959f305605d255d4c843	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.20.0	\N	\N	4595866228
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2024-08-25 14:24:32.003323	4	EXECUTED	8:80230013e961310e6872e871be424a63	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.20.0	\N	\N	4595866228
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2024-08-25 14:24:32.902411	5	EXECUTED	8:67f4c20929126adc0c8e9bf48279d244	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.20.0	\N	\N	4595866228
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2024-08-25 14:24:32.912138	6	MARK_RAN	8:7311018b0b8179ce14628ab412bb6783	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.20.0	\N	\N	4595866228
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2024-08-25 14:24:33.393763	7	EXECUTED	8:037ba1216c3640f8785ee6b8e7c8e3c1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.20.0	\N	\N	4595866228
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2024-08-25 14:24:33.407364	8	MARK_RAN	8:7fe6ffe4af4df289b3157de32c624263	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.20.0	\N	\N	4595866228
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2024-08-25 14:24:33.4772	9	EXECUTED	8:9c136bc3187083a98745c7d03bc8a303	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.20.0	\N	\N	4595866228
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2024-08-25 14:24:34.365319	10	EXECUTED	8:b5f09474dca81fb56a97cf5b6553d331	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.20.0	\N	\N	4595866228
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2024-08-25 14:24:34.986045	11	EXECUTED	8:ca924f31bd2a3b219fdcfe78c82dacf4	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.20.0	\N	\N	4595866228
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2024-08-25 14:24:35.00367	12	MARK_RAN	8:8acad7483e106416bcfa6f3b824a16cd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.20.0	\N	\N	4595866228
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2024-08-25 14:24:35.389078	13	EXECUTED	8:9b1266d17f4f87c78226f5055408fd5e	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.20.0	\N	\N	4595866228
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-08-25 14:24:35.615369	14	EXECUTED	8:d80ec4ab6dbfe573550ff72396c7e910	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.20.0	\N	\N	4595866228
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-08-25 14:24:35.640245	15	MARK_RAN	8:d86eb172171e7c20b9c849b584d147b2	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.20.0	\N	\N	4595866228
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-08-25 14:24:35.684609	16	MARK_RAN	8:5735f46f0fa60689deb0ecdc2a0dea22	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.20.0	\N	\N	4595866228
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-08-25 14:24:35.723649	17	EXECUTED	8:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.20.0	\N	\N	4595866228
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2024-08-25 14:24:35.964004	18	EXECUTED	8:5c1a8fd2014ac7fc43b90a700f117b23	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.20.0	\N	\N	4595866228
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2024-08-25 14:24:36.395986	19	EXECUTED	8:1f6c2c2dfc362aff4ed75b3f0ef6b331	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.20.0	\N	\N	4595866228
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2024-08-25 14:24:36.421777	20	EXECUTED	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.20.0	\N	\N	4595866228
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2024-08-25 14:24:36.508849	21	MARK_RAN	8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.20.0	\N	\N	4595866228
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2024-08-25 14:24:36.532013	22	MARK_RAN	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.20.0	\N	\N	4595866228
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2024-08-25 14:24:36.807668	23	EXECUTED	8:d9fa18ffa355320395b86270680dd4fe	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.20.0	\N	\N	4595866228
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2024-08-25 14:24:36.895144	24	EXECUTED	8:90cff506fedb06141ffc1c71c4a1214c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.20.0	\N	\N	4595866228
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2024-08-25 14:24:36.93038	25	MARK_RAN	8:11a788aed4961d6d29c427c063af828c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.20.0	\N	\N	4595866228
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2024-08-25 14:24:37.191445	26	EXECUTED	8:a4218e51e1faf380518cce2af5d39b43	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.20.0	\N	\N	4595866228
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2024-08-25 14:24:37.75688	27	EXECUTED	8:d9e9a1bfaa644da9952456050f07bbdc	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.20.0	\N	\N	4595866228
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2024-08-25 14:24:37.791452	28	EXECUTED	8:d1bf991a6163c0acbfe664b615314505	update tableName=RESOURCE_SERVER_POLICY		\N	4.20.0	\N	\N	4595866228
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2024-08-25 14:24:38.20769	29	EXECUTED	8:88a743a1e87ec5e30bf603da68058a8c	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.20.0	\N	\N	4595866228
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2024-08-25 14:24:38.428609	30	EXECUTED	8:c5517863c875d325dea463d00ec26d7a	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.20.0	\N	\N	4595866228
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2024-08-25 14:24:38.56453	31	EXECUTED	8:ada8b4833b74a498f376d7136bc7d327	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.20.0	\N	\N	4595866228
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2024-08-25 14:24:38.586358	32	EXECUTED	8:b9b73c8ea7299457f99fcbb825c263ba	customChange		\N	4.20.0	\N	\N	4595866228
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-08-25 14:24:38.651901	33	EXECUTED	8:07724333e625ccfcfc5adc63d57314f3	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.20.0	\N	\N	4595866228
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-08-25 14:24:38.65914	34	MARK_RAN	8:8b6fd445958882efe55deb26fc541a7b	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.20.0	\N	\N	4595866228
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-08-25 14:24:38.828402	35	EXECUTED	8:29b29cfebfd12600897680147277a9d7	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.20.0	\N	\N	4595866228
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2024-08-25 14:24:38.898085	36	EXECUTED	8:73ad77ca8fd0410c7f9f15a471fa52bc	addColumn tableName=REALM		\N	4.20.0	\N	\N	4595866228
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-08-25 14:24:39.027597	37	EXECUTED	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.20.0	\N	\N	4595866228
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2024-08-25 14:24:39.137649	38	EXECUTED	8:27180251182e6c31846c2ddab4bc5781	addColumn tableName=FED_USER_CONSENT		\N	4.20.0	\N	\N	4595866228
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2024-08-25 14:24:39.298084	39	EXECUTED	8:d56f201bfcfa7a1413eb3e9bc02978f9	addColumn tableName=IDENTITY_PROVIDER		\N	4.20.0	\N	\N	4595866228
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-08-25 14:24:39.311941	40	MARK_RAN	8:91f5522bf6afdc2077dfab57fbd3455c	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.20.0	\N	\N	4595866228
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-08-25 14:24:39.347208	41	MARK_RAN	8:0f01b554f256c22caeb7d8aee3a1cdc8	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.20.0	\N	\N	4595866228
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2024-08-25 14:24:39.54591	42	EXECUTED	8:ab91cf9cee415867ade0e2df9651a947	customChange		\N	4.20.0	\N	\N	4595866228
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-08-25 14:24:42.163703	43	EXECUTED	8:ceac9b1889e97d602caf373eadb0d4b7	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.20.0	\N	\N	4595866228
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2024-08-25 14:24:42.218546	44	EXECUTED	8:84b986e628fe8f7fd8fd3c275c5259f2	addColumn tableName=USER_ENTITY		\N	4.20.0	\N	\N	4595866228
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-08-25 14:24:42.243234	45	EXECUTED	8:a164ae073c56ffdbc98a615493609a52	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.20.0	\N	\N	4595866228
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-08-25 14:24:42.292094	46	EXECUTED	8:70a2b4f1f4bd4dbf487114bdb1810e64	customChange		\N	4.20.0	\N	\N	4595866228
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-08-25 14:24:42.302952	47	MARK_RAN	8:7be68b71d2f5b94b8df2e824f2860fa2	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.20.0	\N	\N	4595866228
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-08-25 14:24:42.514379	48	EXECUTED	8:bab7c631093c3861d6cf6144cd944982	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.20.0	\N	\N	4595866228
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-08-25 14:24:42.531103	49	EXECUTED	8:fa809ac11877d74d76fe40869916daad	addColumn tableName=REALM		\N	4.20.0	\N	\N	4595866228
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2024-08-25 14:24:42.841664	50	EXECUTED	8:fac23540a40208f5f5e326f6ceb4d291	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.20.0	\N	\N	4595866228
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2024-08-25 14:24:43.245836	51	EXECUTED	8:2612d1b8a97e2b5588c346e817307593	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.20.0	\N	\N	4595866228
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2024-08-25 14:24:43.363892	52	EXECUTED	8:9842f155c5db2206c88bcb5d1046e941	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.20.0	\N	\N	4595866228
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2024-08-25 14:24:43.384228	53	EXECUTED	8:2e12e06e45498406db72d5b3da5bbc76	update tableName=REALM		\N	4.20.0	\N	\N	4595866228
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2024-08-25 14:24:43.411087	54	EXECUTED	8:33560e7c7989250c40da3abdabdc75a4	update tableName=CLIENT		\N	4.20.0	\N	\N	4595866228
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-08-25 14:24:43.498362	55	EXECUTED	8:87a8d8542046817a9107c7eb9cbad1cd	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.20.0	\N	\N	4595866228
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-08-25 14:24:43.546298	56	EXECUTED	8:3ea08490a70215ed0088c273d776311e	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.20.0	\N	\N	4595866228
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-08-25 14:24:43.708528	57	EXECUTED	8:2d56697c8723d4592ab608ce14b6ed68	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.20.0	\N	\N	4595866228
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-08-25 14:24:44.523869	58	EXECUTED	8:3e423e249f6068ea2bbe48bf907f9d86	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.20.0	\N	\N	4595866228
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2024-08-25 14:24:44.696624	59	EXECUTED	8:15cabee5e5df0ff099510a0fc03e4103	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.20.0	\N	\N	4595866228
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2024-08-25 14:24:44.741337	60	EXECUTED	8:4b80200af916ac54d2ffbfc47918ab0e	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.20.0	\N	\N	4595866228
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-08-25 14:24:44.890946	61	EXECUTED	8:66564cd5e168045d52252c5027485bbb	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.20.0	\N	\N	4595866228
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-08-25 14:24:44.998457	62	EXECUTED	8:1c7064fafb030222be2bd16ccf690f6f	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.20.0	\N	\N	4595866228
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2024-08-25 14:24:45.045106	63	EXECUTED	8:2de18a0dce10cdda5c7e65c9b719b6e5	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.20.0	\N	\N	4595866228
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2024-08-25 14:24:45.103626	64	EXECUTED	8:03e413dd182dcbd5c57e41c34d0ef682	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.20.0	\N	\N	4595866228
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2024-08-25 14:24:45.124157	65	EXECUTED	8:d27b42bb2571c18fbe3fe4e4fb7582a7	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.20.0	\N	\N	4595866228
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2024-08-25 14:24:45.209095	66	EXECUTED	8:698baf84d9fd0027e9192717c2154fb8	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.20.0	\N	\N	4595866228
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2024-08-25 14:24:45.235027	67	EXECUTED	8:ced8822edf0f75ef26eb51582f9a821a	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.20.0	\N	\N	4595866228
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2024-08-25 14:24:45.247814	68	EXECUTED	8:f0abba004cf429e8afc43056df06487d	addColumn tableName=REALM		\N	4.20.0	\N	\N	4595866228
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2024-08-25 14:24:45.303145	69	EXECUTED	8:6662f8b0b611caa359fcf13bf63b4e24	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.20.0	\N	\N	4595866228
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2024-08-25 14:24:45.356434	70	EXECUTED	8:9e6b8009560f684250bdbdf97670d39e	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.20.0	\N	\N	4595866228
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2024-08-25 14:24:45.382124	71	EXECUTED	8:4223f561f3b8dc655846562b57bb502e	addColumn tableName=RESOURCE_SERVER		\N	4.20.0	\N	\N	4595866228
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-08-25 14:24:45.416502	72	EXECUTED	8:215a31c398b363ce383a2b301202f29e	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.20.0	\N	\N	4595866228
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-08-25 14:24:45.44324	73	EXECUTED	8:83f7a671792ca98b3cbd3a1a34862d3d	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.20.0	\N	\N	4595866228
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-08-25 14:24:45.448775	74	MARK_RAN	8:f58ad148698cf30707a6efbdf8061aa7	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.20.0	\N	\N	4595866228
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-08-25 14:24:45.481178	75	EXECUTED	8:79e4fd6c6442980e58d52ffc3ee7b19c	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.20.0	\N	\N	4595866228
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-08-25 14:24:45.520538	76	EXECUTED	8:87af6a1e6d241ca4b15801d1f86a297d	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.20.0	\N	\N	4595866228
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-08-25 14:24:45.546198	77	EXECUTED	8:b44f8d9b7b6ea455305a6d72a200ed15	addColumn tableName=CLIENT		\N	4.20.0	\N	\N	4595866228
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-08-25 14:24:45.551723	78	MARK_RAN	8:2d8ed5aaaeffd0cb004c046b4a903ac5	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.20.0	\N	\N	4595866228
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-08-25 14:24:45.627843	79	EXECUTED	8:e290c01fcbc275326c511633f6e2acde	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.20.0	\N	\N	4595866228
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-08-25 14:24:45.651195	80	MARK_RAN	8:c9db8784c33cea210872ac2d805439f8	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.20.0	\N	\N	4595866228
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-08-25 14:24:45.692169	81	EXECUTED	8:95b676ce8fc546a1fcfb4c92fae4add5	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.20.0	\N	\N	4595866228
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-08-25 14:24:45.698625	82	MARK_RAN	8:38a6b2a41f5651018b1aca93a41401e5	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.20.0	\N	\N	4595866228
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-08-25 14:24:45.711884	83	EXECUTED	8:3fb99bcad86a0229783123ac52f7609c	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.20.0	\N	\N	4595866228
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-08-25 14:24:45.71729	84	MARK_RAN	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.20.0	\N	\N	4595866228
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-08-25 14:24:45.752588	85	EXECUTED	8:ab4f863f39adafd4c862f7ec01890abc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.20.0	\N	\N	4595866228
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2024-08-25 14:24:45.80627	86	EXECUTED	8:13c419a0eb336e91ee3a3bf8fda6e2a7	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.20.0	\N	\N	4595866228
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-08-25 14:24:45.842028	87	EXECUTED	8:e3fb1e698e0471487f51af1ed80fe3ac	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.20.0	\N	\N	4595866228
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-08-25 14:24:45.989299	88	EXECUTED	8:babadb686aab7b56562817e60bf0abd0	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.20.0	\N	\N	4595866228
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-08-25 14:24:46.088637	89	EXECUTED	8:72d03345fda8e2f17093d08801947773	addColumn tableName=REALM; customChange		\N	4.20.0	\N	\N	4595866228
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-08-25 14:24:46.105327	90	EXECUTED	8:61c9233951bd96ffecd9ba75f7d978a4	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.20.0	\N	\N	4595866228
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-08-25 14:24:46.159257	91	EXECUTED	8:ea82e6ad945cec250af6372767b25525	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.20.0	\N	\N	4595866228
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-08-25 14:24:46.223259	92	EXECUTED	8:d3f4a33f41d960ddacd7e2ef30d126b3	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.20.0	\N	\N	4595866228
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-08-25 14:24:46.259048	93	MARK_RAN	8:1284a27fbd049d65831cb6fc07c8a783	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.20.0	\N	\N	4595866228
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-08-25 14:24:46.34086	94	EXECUTED	8:9d11b619db2ae27c25853b8a37cd0dea	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.20.0	\N	\N	4595866228
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-08-25 14:24:46.383502	95	MARK_RAN	8:3002bb3997451bb9e8bac5c5cd8d6327	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.20.0	\N	\N	4595866228
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-08-25 14:24:46.459514	96	EXECUTED	8:dfbee0d6237a23ef4ccbb7a4e063c163	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.20.0	\N	\N	4595866228
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-08-25 14:24:46.552133	97	EXECUTED	8:75f3e372df18d38c62734eebb986b960	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.20.0	\N	\N	4595866228
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-08-25 14:24:46.563528	98	MARK_RAN	8:7fee73eddf84a6035691512c85637eef	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.20.0	\N	\N	4595866228
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-08-25 14:24:46.596549	99	MARK_RAN	8:7a11134ab12820f999fbf3bb13c3adc8	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.20.0	\N	\N	4595866228
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-08-25 14:24:46.636688	100	EXECUTED	8:c0f6eaac1f3be773ffe54cb5b8482b70	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.20.0	\N	\N	4595866228
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-08-25 14:24:46.642131	101	MARK_RAN	8:18186f0008b86e0f0f49b0c4d0e842ac	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.20.0	\N	\N	4595866228
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-08-25 14:24:46.681114	102	EXECUTED	8:09c2780bcb23b310a7019d217dc7b433	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.20.0	\N	\N	4595866228
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-08-25 14:24:46.774933	103	EXECUTED	8:276a44955eab693c970a42880197fff2	customChange		\N	4.20.0	\N	\N	4595866228
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2024-08-25 14:24:46.806214	104	EXECUTED	8:ba8ee3b694d043f2bfc1a1079d0760d7	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.20.0	\N	\N	4595866228
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2024-08-25 14:24:46.868329	105	EXECUTED	8:5e06b1d75f5d17685485e610c2851b17	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.20.0	\N	\N	4595866228
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2024-08-25 14:24:46.978191	106	EXECUTED	8:4b80546c1dc550ac552ee7b24a4ab7c0	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.20.0	\N	\N	4595866228
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2024-08-25 14:24:47.010512	107	EXECUTED	8:af510cd1bb2ab6339c45372f3e491696	customChange		\N	4.20.0	\N	\N	4595866228
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-08-25 14:24:47.03951	108	EXECUTED	8:05c99fc610845ef66ee812b7921af0ef	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.20.0	\N	\N	4595866228
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-08-25 14:24:47.045185	109	MARK_RAN	8:314e803baf2f1ec315b3464e398b8247	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.20.0	\N	\N	4595866228
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-08-25 14:24:47.071467	110	EXECUTED	8:56e4677e7e12556f70b604c573840100	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.20.0	\N	\N	4595866228
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2024-08-25 14:24:47.096516	111	EXECUTED	8:8806cb33d2a546ce770384bf98cf6eac	customChange		\N	4.20.0	\N	\N	4595866228
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2024-08-25 14:24:47.325677	112	EXECUTED	8:fdb2924649d30555ab3a1744faba4928	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.20.0	\N	\N	4595866228
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2024-08-25 14:24:47.339062	113	MARK_RAN	8:1c96cc2b10903bd07a03670098d67fd6	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.20.0	\N	\N	4595866228
22.0.0-17484	keycloak	META-INF/jpa-changelog-22.0.0.xml	2024-08-25 14:24:47.362283	114	EXECUTED	8:4c3d4e8b142a66fcdf21b89a4dd33301	customChange		\N	4.20.0	\N	\N	4595866228
\.


--
-- TOC entry 4151 (class 0 OID 16389)
-- Dependencies: 216
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- TOC entry 4235 (class 0 OID 17785)
-- Dependencies: 300
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
dbdc26c7-3f31-4332-bae9-a245a94f1c51	a93412bc-2e8f-408f-b678-96b2db50aa7b	f
dbdc26c7-3f31-4332-bae9-a245a94f1c51	9797765e-2d84-4757-808c-987ded6b9bd6	t
dbdc26c7-3f31-4332-bae9-a245a94f1c51	9d0cab5c-afcc-4ea3-b101-4d42e4d415b2	t
dbdc26c7-3f31-4332-bae9-a245a94f1c51	04c9d566-ca21-4661-8fbf-5799d55c26f6	t
dbdc26c7-3f31-4332-bae9-a245a94f1c51	b8a91147-c5d1-4e67-a0ab-9330c21282bf	f
dbdc26c7-3f31-4332-bae9-a245a94f1c51	58c267c8-9d53-4a9e-84d1-0b0b9e92dd13	f
dbdc26c7-3f31-4332-bae9-a245a94f1c51	e04180aa-d199-4222-84a2-ab487af4f458	t
dbdc26c7-3f31-4332-bae9-a245a94f1c51	04f2206f-661d-43d4-b105-b87888d229dc	t
dbdc26c7-3f31-4332-bae9-a245a94f1c51	f54d7cfb-b527-41b2-a361-be78068b8512	f
dbdc26c7-3f31-4332-bae9-a245a94f1c51	05cb7b86-5530-43d9-84a2-596f3b5c2cf0	t
e714c293-8916-447d-acec-a6202b90ae13	94fb7fee-6b5a-4df6-852f-46ee154e8983	f
e714c293-8916-447d-acec-a6202b90ae13	f105853c-ec32-4b4b-ac69-b85293c78129	t
e714c293-8916-447d-acec-a6202b90ae13	f8514664-5046-4036-9448-5ea49690ca37	t
e714c293-8916-447d-acec-a6202b90ae13	4f6ddbd6-8190-490c-98b6-81fbbbd67b06	t
e714c293-8916-447d-acec-a6202b90ae13	83ffa6b9-c992-40aa-83c8-4b70d71100a7	f
e714c293-8916-447d-acec-a6202b90ae13	f9fff078-cc2c-414d-a768-1049b42ad6ee	f
e714c293-8916-447d-acec-a6202b90ae13	851dc12f-6d81-402b-99a9-489735752570	t
e714c293-8916-447d-acec-a6202b90ae13	f2fba91a-7d8d-435e-b1d6-75d49744cf4a	f
e714c293-8916-447d-acec-a6202b90ae13	30b18b0a-c2b0-42cb-8070-affa9097da22	t
e714c293-8916-447d-acec-a6202b90ae13	2495d8ed-1b04-4f77-8425-5e74f89d364e	t
\.


--
-- TOC entry 4158 (class 0 OID 16429)
-- Dependencies: 223
-- Data for Name: event_entity; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- TOC entry 4223 (class 0 OID 17484)
-- Dependencies: 288
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- TOC entry 4224 (class 0 OID 17489)
-- Dependencies: 289
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- TOC entry 4237 (class 0 OID 17811)
-- Dependencies: 302
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- TOC entry 4225 (class 0 OID 17498)
-- Dependencies: 290
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- TOC entry 4226 (class 0 OID 17507)
-- Dependencies: 291
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 4227 (class 0 OID 17510)
-- Dependencies: 292
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 4228 (class 0 OID 17516)
-- Dependencies: 293
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 4181 (class 0 OID 16806)
-- Dependencies: 246
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- TOC entry 4231 (class 0 OID 17581)
-- Dependencies: 296
-- Data for Name: federated_user; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- TOC entry 4207 (class 0 OID 17208)
-- Dependencies: 272
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- TOC entry 4206 (class 0 OID 17205)
-- Dependencies: 271
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- TOC entry 4182 (class 0 OID 16811)
-- Dependencies: 247
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- TOC entry 4183 (class 0 OID 16820)
-- Dependencies: 248
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- TOC entry 4188 (class 0 OID 16924)
-- Dependencies: 253
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- TOC entry 4189 (class 0 OID 16929)
-- Dependencies: 254
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- TOC entry 4205 (class 0 OID 17202)
-- Dependencies: 270
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- TOC entry 4159 (class 0 OID 16437)
-- Dependencies: 224
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
91b63f58-c8c6-4f40-97e7-718f9692e901	dbdc26c7-3f31-4332-bae9-a245a94f1c51	f	${role_default-roles}	default-roles-master	dbdc26c7-3f31-4332-bae9-a245a94f1c51	\N	\N
339534d1-f21a-4855-95c7-a111d825252d	dbdc26c7-3f31-4332-bae9-a245a94f1c51	f	${role_create-realm}	create-realm	dbdc26c7-3f31-4332-bae9-a245a94f1c51	\N	\N
e3f0d47e-a0df-426e-aaf7-713831196bb5	dbdc26c7-3f31-4332-bae9-a245a94f1c51	f	${role_admin}	admin	dbdc26c7-3f31-4332-bae9-a245a94f1c51	\N	\N
133f6950-cca1-4c41-9132-baa7f35aa445	bc881421-2f5a-4038-8c43-e3301f49af4a	t	${role_create-client}	create-client	dbdc26c7-3f31-4332-bae9-a245a94f1c51	bc881421-2f5a-4038-8c43-e3301f49af4a	\N
3367e8be-5ec4-4e3e-8181-67008d85ea12	bc881421-2f5a-4038-8c43-e3301f49af4a	t	${role_view-realm}	view-realm	dbdc26c7-3f31-4332-bae9-a245a94f1c51	bc881421-2f5a-4038-8c43-e3301f49af4a	\N
632757f2-8e95-4f7d-8d86-fdaa5a246268	bc881421-2f5a-4038-8c43-e3301f49af4a	t	${role_view-users}	view-users	dbdc26c7-3f31-4332-bae9-a245a94f1c51	bc881421-2f5a-4038-8c43-e3301f49af4a	\N
e04eef66-5ad0-4daa-a0ed-8611d27e8a1c	bc881421-2f5a-4038-8c43-e3301f49af4a	t	${role_view-clients}	view-clients	dbdc26c7-3f31-4332-bae9-a245a94f1c51	bc881421-2f5a-4038-8c43-e3301f49af4a	\N
ed0d3805-38de-47d0-82cb-62142cb54e2a	bc881421-2f5a-4038-8c43-e3301f49af4a	t	${role_view-events}	view-events	dbdc26c7-3f31-4332-bae9-a245a94f1c51	bc881421-2f5a-4038-8c43-e3301f49af4a	\N
17d8ae96-efe7-4417-9d85-6acfedcbc4b5	bc881421-2f5a-4038-8c43-e3301f49af4a	t	${role_view-identity-providers}	view-identity-providers	dbdc26c7-3f31-4332-bae9-a245a94f1c51	bc881421-2f5a-4038-8c43-e3301f49af4a	\N
97d694ed-cea0-495f-89d8-974278af532f	bc881421-2f5a-4038-8c43-e3301f49af4a	t	${role_view-authorization}	view-authorization	dbdc26c7-3f31-4332-bae9-a245a94f1c51	bc881421-2f5a-4038-8c43-e3301f49af4a	\N
df69a38a-5a70-4729-bdd7-bddb71f8e08e	bc881421-2f5a-4038-8c43-e3301f49af4a	t	${role_manage-realm}	manage-realm	dbdc26c7-3f31-4332-bae9-a245a94f1c51	bc881421-2f5a-4038-8c43-e3301f49af4a	\N
c24ebe59-24c8-4316-9e8d-b2ae6d59f843	bc881421-2f5a-4038-8c43-e3301f49af4a	t	${role_manage-users}	manage-users	dbdc26c7-3f31-4332-bae9-a245a94f1c51	bc881421-2f5a-4038-8c43-e3301f49af4a	\N
11e5af1d-5e51-4cc8-a836-bb804b9e4c87	bc881421-2f5a-4038-8c43-e3301f49af4a	t	${role_manage-clients}	manage-clients	dbdc26c7-3f31-4332-bae9-a245a94f1c51	bc881421-2f5a-4038-8c43-e3301f49af4a	\N
f1662fe5-391b-4a1e-a772-eecb7e554af3	bc881421-2f5a-4038-8c43-e3301f49af4a	t	${role_manage-events}	manage-events	dbdc26c7-3f31-4332-bae9-a245a94f1c51	bc881421-2f5a-4038-8c43-e3301f49af4a	\N
9cb80070-6855-4d9c-a43a-df21fe4f4f18	bc881421-2f5a-4038-8c43-e3301f49af4a	t	${role_manage-identity-providers}	manage-identity-providers	dbdc26c7-3f31-4332-bae9-a245a94f1c51	bc881421-2f5a-4038-8c43-e3301f49af4a	\N
86b05a8e-57c1-4925-bf9e-caa8184713fd	bc881421-2f5a-4038-8c43-e3301f49af4a	t	${role_manage-authorization}	manage-authorization	dbdc26c7-3f31-4332-bae9-a245a94f1c51	bc881421-2f5a-4038-8c43-e3301f49af4a	\N
20989f5f-3445-495f-9d77-77da7e5aebd2	bc881421-2f5a-4038-8c43-e3301f49af4a	t	${role_query-users}	query-users	dbdc26c7-3f31-4332-bae9-a245a94f1c51	bc881421-2f5a-4038-8c43-e3301f49af4a	\N
9d928eb6-fdce-4b99-893b-488f6def90fc	bc881421-2f5a-4038-8c43-e3301f49af4a	t	${role_query-clients}	query-clients	dbdc26c7-3f31-4332-bae9-a245a94f1c51	bc881421-2f5a-4038-8c43-e3301f49af4a	\N
6abbb1f8-5672-42a7-bcb4-bb7caa6280b8	bc881421-2f5a-4038-8c43-e3301f49af4a	t	${role_query-realms}	query-realms	dbdc26c7-3f31-4332-bae9-a245a94f1c51	bc881421-2f5a-4038-8c43-e3301f49af4a	\N
843c2cb1-221e-427f-9439-0d7c5e023edd	bc881421-2f5a-4038-8c43-e3301f49af4a	t	${role_query-groups}	query-groups	dbdc26c7-3f31-4332-bae9-a245a94f1c51	bc881421-2f5a-4038-8c43-e3301f49af4a	\N
d270dac7-5931-42c1-bf34-9a65980827f7	14dbf716-a258-4e80-b0c9-2d80be221444	t	${role_view-profile}	view-profile	dbdc26c7-3f31-4332-bae9-a245a94f1c51	14dbf716-a258-4e80-b0c9-2d80be221444	\N
fd730af9-7011-41e6-a59f-43e8b39db0a7	14dbf716-a258-4e80-b0c9-2d80be221444	t	${role_manage-account}	manage-account	dbdc26c7-3f31-4332-bae9-a245a94f1c51	14dbf716-a258-4e80-b0c9-2d80be221444	\N
fa8b4fd6-4e7a-4f0b-9603-8b607f8cf411	14dbf716-a258-4e80-b0c9-2d80be221444	t	${role_manage-account-links}	manage-account-links	dbdc26c7-3f31-4332-bae9-a245a94f1c51	14dbf716-a258-4e80-b0c9-2d80be221444	\N
2fd24682-3609-4654-9669-9fab90502e28	14dbf716-a258-4e80-b0c9-2d80be221444	t	${role_view-applications}	view-applications	dbdc26c7-3f31-4332-bae9-a245a94f1c51	14dbf716-a258-4e80-b0c9-2d80be221444	\N
92da983b-f40b-43ba-9362-8cf9bd5a80fc	14dbf716-a258-4e80-b0c9-2d80be221444	t	${role_view-consent}	view-consent	dbdc26c7-3f31-4332-bae9-a245a94f1c51	14dbf716-a258-4e80-b0c9-2d80be221444	\N
ffec91b2-2746-4dd8-bf01-d59d85e91528	14dbf716-a258-4e80-b0c9-2d80be221444	t	${role_manage-consent}	manage-consent	dbdc26c7-3f31-4332-bae9-a245a94f1c51	14dbf716-a258-4e80-b0c9-2d80be221444	\N
72ada4b6-02d1-435b-bdcc-3f5f19da410f	14dbf716-a258-4e80-b0c9-2d80be221444	t	${role_view-groups}	view-groups	dbdc26c7-3f31-4332-bae9-a245a94f1c51	14dbf716-a258-4e80-b0c9-2d80be221444	\N
aabab8b1-8d66-4866-a420-01acf3eb8046	14dbf716-a258-4e80-b0c9-2d80be221444	t	${role_delete-account}	delete-account	dbdc26c7-3f31-4332-bae9-a245a94f1c51	14dbf716-a258-4e80-b0c9-2d80be221444	\N
325e8d11-d6c7-4f5b-9db6-1b3f8ee8510a	d70e91cc-f2f3-45a6-b55e-c83af55cfa39	t	${role_read-token}	read-token	dbdc26c7-3f31-4332-bae9-a245a94f1c51	d70e91cc-f2f3-45a6-b55e-c83af55cfa39	\N
1bed019d-a68d-4a3b-901a-c3e229db0fc0	bc881421-2f5a-4038-8c43-e3301f49af4a	t	${role_impersonation}	impersonation	dbdc26c7-3f31-4332-bae9-a245a94f1c51	bc881421-2f5a-4038-8c43-e3301f49af4a	\N
80d9948f-be08-4ede-a0ed-5a8bb99ee6ad	dbdc26c7-3f31-4332-bae9-a245a94f1c51	f	${role_offline-access}	offline_access	dbdc26c7-3f31-4332-bae9-a245a94f1c51	\N	\N
d8793888-f0cd-434f-ae9a-994ccd1c8af5	dbdc26c7-3f31-4332-bae9-a245a94f1c51	f	${role_uma_authorization}	uma_authorization	dbdc26c7-3f31-4332-bae9-a245a94f1c51	\N	\N
c346a324-63f8-4d17-8afd-57237cbbb385	e714c293-8916-447d-acec-a6202b90ae13	f	${role_default-roles}	default-roles-secure-client-realm	e714c293-8916-447d-acec-a6202b90ae13	\N	\N
18838fae-d334-4235-b9cd-fa4c188ec1c8	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	t	${role_create-client}	create-client	dbdc26c7-3f31-4332-bae9-a245a94f1c51	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	\N
b99cce9d-ca3b-4357-8e6a-d97f584ea873	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	t	${role_view-realm}	view-realm	dbdc26c7-3f31-4332-bae9-a245a94f1c51	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	\N
a81a7d02-db4e-470c-bd60-8036ed528846	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	t	${role_view-users}	view-users	dbdc26c7-3f31-4332-bae9-a245a94f1c51	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	\N
d539c9d4-84ac-4c53-a7ee-deae15a969cd	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	t	${role_view-clients}	view-clients	dbdc26c7-3f31-4332-bae9-a245a94f1c51	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	\N
e6064096-506e-4c2c-aca7-0e2e4715766d	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	t	${role_view-events}	view-events	dbdc26c7-3f31-4332-bae9-a245a94f1c51	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	\N
cdfefad0-9b50-4a7e-80b7-348263fc7e4d	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	t	${role_view-identity-providers}	view-identity-providers	dbdc26c7-3f31-4332-bae9-a245a94f1c51	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	\N
176bd3ec-50fb-4b3d-ae6a-7a0bcdacab98	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	t	${role_view-authorization}	view-authorization	dbdc26c7-3f31-4332-bae9-a245a94f1c51	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	\N
0d355637-4957-45f0-8dee-fd97bd43c383	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	t	${role_manage-realm}	manage-realm	dbdc26c7-3f31-4332-bae9-a245a94f1c51	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	\N
7aaaf853-8da5-4620-80e4-44786aefb7c6	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	t	${role_manage-users}	manage-users	dbdc26c7-3f31-4332-bae9-a245a94f1c51	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	\N
6f203878-864b-43ef-89a7-21d6b2b7a5ac	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	t	${role_manage-clients}	manage-clients	dbdc26c7-3f31-4332-bae9-a245a94f1c51	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	\N
faa39396-7e3b-464d-a618-eab6b67eda86	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	t	${role_manage-events}	manage-events	dbdc26c7-3f31-4332-bae9-a245a94f1c51	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	\N
30faaa38-c37b-4a45-b354-009923fdf34c	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	t	${role_manage-identity-providers}	manage-identity-providers	dbdc26c7-3f31-4332-bae9-a245a94f1c51	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	\N
6c0fa72c-105f-42dd-a02a-7c4932f1587d	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	t	${role_manage-authorization}	manage-authorization	dbdc26c7-3f31-4332-bae9-a245a94f1c51	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	\N
841d466a-6a27-45fd-a59c-7f1fc1626ae6	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	t	${role_query-users}	query-users	dbdc26c7-3f31-4332-bae9-a245a94f1c51	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	\N
3dad17aa-b43d-4bba-bf83-e52772e04f2d	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	t	${role_query-clients}	query-clients	dbdc26c7-3f31-4332-bae9-a245a94f1c51	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	\N
5f7ceb33-c1b8-4cb4-b98c-57332b9bdef0	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	t	${role_query-realms}	query-realms	dbdc26c7-3f31-4332-bae9-a245a94f1c51	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	\N
dccacab0-ea9b-4835-9aa1-9c7fcda8d763	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	t	${role_query-groups}	query-groups	dbdc26c7-3f31-4332-bae9-a245a94f1c51	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	\N
d6341ca2-a6b3-4275-8227-ab5722eb5953	a6689f74-8136-48a5-aaf2-d301d339aaff	t	${role_realm-admin}	realm-admin	e714c293-8916-447d-acec-a6202b90ae13	a6689f74-8136-48a5-aaf2-d301d339aaff	\N
4040561a-b90e-4856-847c-95cf8e54ae90	a6689f74-8136-48a5-aaf2-d301d339aaff	t	${role_create-client}	create-client	e714c293-8916-447d-acec-a6202b90ae13	a6689f74-8136-48a5-aaf2-d301d339aaff	\N
591e5843-83f3-4f80-a829-357806949255	a6689f74-8136-48a5-aaf2-d301d339aaff	t	${role_view-realm}	view-realm	e714c293-8916-447d-acec-a6202b90ae13	a6689f74-8136-48a5-aaf2-d301d339aaff	\N
47021daa-d96e-4104-a536-521a84b2ab28	a6689f74-8136-48a5-aaf2-d301d339aaff	t	${role_view-users}	view-users	e714c293-8916-447d-acec-a6202b90ae13	a6689f74-8136-48a5-aaf2-d301d339aaff	\N
ac1e0677-80f4-4807-bf5e-b7270c3c5acc	a6689f74-8136-48a5-aaf2-d301d339aaff	t	${role_view-clients}	view-clients	e714c293-8916-447d-acec-a6202b90ae13	a6689f74-8136-48a5-aaf2-d301d339aaff	\N
a8cab8de-e3f6-4cb8-8eda-d1ef13aacb1d	a6689f74-8136-48a5-aaf2-d301d339aaff	t	${role_view-events}	view-events	e714c293-8916-447d-acec-a6202b90ae13	a6689f74-8136-48a5-aaf2-d301d339aaff	\N
e765f517-2fea-4e67-8ea0-0bdd48460b14	a6689f74-8136-48a5-aaf2-d301d339aaff	t	${role_view-identity-providers}	view-identity-providers	e714c293-8916-447d-acec-a6202b90ae13	a6689f74-8136-48a5-aaf2-d301d339aaff	\N
f7966ada-bb79-4fc5-bbd6-749eb170ed67	a6689f74-8136-48a5-aaf2-d301d339aaff	t	${role_view-authorization}	view-authorization	e714c293-8916-447d-acec-a6202b90ae13	a6689f74-8136-48a5-aaf2-d301d339aaff	\N
c87e1fc9-47f6-4b21-b2fc-5f4de477aa6a	a6689f74-8136-48a5-aaf2-d301d339aaff	t	${role_manage-realm}	manage-realm	e714c293-8916-447d-acec-a6202b90ae13	a6689f74-8136-48a5-aaf2-d301d339aaff	\N
327532a4-d84d-4fe8-9f24-1239be56c6bf	a6689f74-8136-48a5-aaf2-d301d339aaff	t	${role_manage-users}	manage-users	e714c293-8916-447d-acec-a6202b90ae13	a6689f74-8136-48a5-aaf2-d301d339aaff	\N
c0eccde8-6b4b-4069-8aa5-e8d88fdf9b75	a6689f74-8136-48a5-aaf2-d301d339aaff	t	${role_manage-clients}	manage-clients	e714c293-8916-447d-acec-a6202b90ae13	a6689f74-8136-48a5-aaf2-d301d339aaff	\N
79f6db28-5304-4e4d-9bc5-18fa06e054b0	a6689f74-8136-48a5-aaf2-d301d339aaff	t	${role_manage-events}	manage-events	e714c293-8916-447d-acec-a6202b90ae13	a6689f74-8136-48a5-aaf2-d301d339aaff	\N
95bef6ff-305a-48df-840d-dceff3995f2e	a6689f74-8136-48a5-aaf2-d301d339aaff	t	${role_manage-identity-providers}	manage-identity-providers	e714c293-8916-447d-acec-a6202b90ae13	a6689f74-8136-48a5-aaf2-d301d339aaff	\N
2989a6df-8869-4a5d-9e58-d8332a8fae38	a6689f74-8136-48a5-aaf2-d301d339aaff	t	${role_manage-authorization}	manage-authorization	e714c293-8916-447d-acec-a6202b90ae13	a6689f74-8136-48a5-aaf2-d301d339aaff	\N
8d552f84-4187-4e83-ad83-97ec713f4c18	a6689f74-8136-48a5-aaf2-d301d339aaff	t	${role_query-users}	query-users	e714c293-8916-447d-acec-a6202b90ae13	a6689f74-8136-48a5-aaf2-d301d339aaff	\N
b638d61b-0316-4af5-aabd-ee4fd548b39d	a6689f74-8136-48a5-aaf2-d301d339aaff	t	${role_query-clients}	query-clients	e714c293-8916-447d-acec-a6202b90ae13	a6689f74-8136-48a5-aaf2-d301d339aaff	\N
b95187e4-39e0-4444-8003-f686473e8b3d	a6689f74-8136-48a5-aaf2-d301d339aaff	t	${role_query-realms}	query-realms	e714c293-8916-447d-acec-a6202b90ae13	a6689f74-8136-48a5-aaf2-d301d339aaff	\N
2308c7e0-7e5b-4090-ac39-3575a2cf5ea2	a6689f74-8136-48a5-aaf2-d301d339aaff	t	${role_query-groups}	query-groups	e714c293-8916-447d-acec-a6202b90ae13	a6689f74-8136-48a5-aaf2-d301d339aaff	\N
787af660-a649-48e0-835a-7df228db5a91	d2a19db5-9d31-4108-9e49-63cd169356d7	t	${role_view-profile}	view-profile	e714c293-8916-447d-acec-a6202b90ae13	d2a19db5-9d31-4108-9e49-63cd169356d7	\N
11489bfc-ac3b-40ee-a5c9-c41b693a2c04	d2a19db5-9d31-4108-9e49-63cd169356d7	t	${role_manage-account}	manage-account	e714c293-8916-447d-acec-a6202b90ae13	d2a19db5-9d31-4108-9e49-63cd169356d7	\N
30c56810-7337-4e91-ba9a-20717e4362cc	d2a19db5-9d31-4108-9e49-63cd169356d7	t	${role_manage-account-links}	manage-account-links	e714c293-8916-447d-acec-a6202b90ae13	d2a19db5-9d31-4108-9e49-63cd169356d7	\N
bf2aafaf-ace6-47d2-bea0-ef726b363290	d2a19db5-9d31-4108-9e49-63cd169356d7	t	${role_view-applications}	view-applications	e714c293-8916-447d-acec-a6202b90ae13	d2a19db5-9d31-4108-9e49-63cd169356d7	\N
033ff238-c488-418b-b245-ee870b0a9064	d2a19db5-9d31-4108-9e49-63cd169356d7	t	${role_view-consent}	view-consent	e714c293-8916-447d-acec-a6202b90ae13	d2a19db5-9d31-4108-9e49-63cd169356d7	\N
7448957d-21fb-44b6-9f02-e33147b3fe31	d2a19db5-9d31-4108-9e49-63cd169356d7	t	${role_manage-consent}	manage-consent	e714c293-8916-447d-acec-a6202b90ae13	d2a19db5-9d31-4108-9e49-63cd169356d7	\N
c4a7bde4-2e04-4923-a83b-18a08424747d	d2a19db5-9d31-4108-9e49-63cd169356d7	t	${role_view-groups}	view-groups	e714c293-8916-447d-acec-a6202b90ae13	d2a19db5-9d31-4108-9e49-63cd169356d7	\N
03a4c296-40dc-4102-982e-1fe3a9d3d535	d2a19db5-9d31-4108-9e49-63cd169356d7	t	${role_delete-account}	delete-account	e714c293-8916-447d-acec-a6202b90ae13	d2a19db5-9d31-4108-9e49-63cd169356d7	\N
59dd90f8-8d32-41b4-85d1-59559c6dbe0b	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	t	${role_impersonation}	impersonation	dbdc26c7-3f31-4332-bae9-a245a94f1c51	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	\N
8cd91570-e63f-4d7c-bff1-8355428d1757	a6689f74-8136-48a5-aaf2-d301d339aaff	t	${role_impersonation}	impersonation	e714c293-8916-447d-acec-a6202b90ae13	a6689f74-8136-48a5-aaf2-d301d339aaff	\N
62f28759-9f99-4932-9d5c-d6bce7bc2e6a	a4685d92-0a68-4301-a2bc-78bcb5f46aea	t	${role_read-token}	read-token	e714c293-8916-447d-acec-a6202b90ae13	a4685d92-0a68-4301-a2bc-78bcb5f46aea	\N
845a5fea-62a0-4ea4-83a1-4486495c3c6a	e714c293-8916-447d-acec-a6202b90ae13	f	${role_offline-access}	offline_access	e714c293-8916-447d-acec-a6202b90ae13	\N	\N
5b8bba39-b219-410f-af7a-22cefc7cf42f	e714c293-8916-447d-acec-a6202b90ae13	f	${role_uma_authorization}	uma_authorization	e714c293-8916-447d-acec-a6202b90ae13	\N	\N
02203b11-cac2-4523-9b05-52abc80f353b	ccb6b605-1a41-4064-b9ec-659b971d96d8	t	\N	uma_protection	e714c293-8916-447d-acec-a6202b90ae13	ccb6b605-1a41-4064-b9ec-659b971d96d8	\N
5d669a59-6ef7-47f8-8c3e-ff216b89a0e1	e714c293-8916-447d-acec-a6202b90ae13	f		admin	e714c293-8916-447d-acec-a6202b90ae13	\N	\N
135c59a7-13da-48df-973b-2319f19be1cf	e714c293-8916-447d-acec-a6202b90ae13	f		user	e714c293-8916-447d-acec-a6202b90ae13	\N	\N
\.


--
-- TOC entry 4187 (class 0 OID 16921)
-- Dependencies: 252
-- Data for Name: migration_model; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.migration_model (id, version, update_time) FROM stdin;
mayh9	22.0.4	1724595887
\.


--
-- TOC entry 4204 (class 0 OID 17193)
-- Dependencies: 269
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- TOC entry 4203 (class 0 OID 17188)
-- Dependencies: 268
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- TOC entry 4217 (class 0 OID 17407)
-- Dependencies: 282
-- Data for Name: policy_config; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- TOC entry 4179 (class 0 OID 16795)
-- Dependencies: 244
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
6477dfd5-c441-46db-be2f-803ae51ddb39	audience resolve	openid-connect	oidc-audience-resolve-mapper	b57ee92e-acfc-4b20-8b27-ef9367de2339	\N
f595c5b8-7bf6-48a4-8ee7-9aa6b5a70492	locale	openid-connect	oidc-usermodel-attribute-mapper	d1230af8-b5d4-43e6-abaa-535e227f6242	\N
2e53a0d9-a422-4154-b3ed-3f1579e2b994	role list	saml	saml-role-list-mapper	\N	9797765e-2d84-4757-808c-987ded6b9bd6
58350aa2-426e-4d07-bdb3-0f7837d58cd0	full name	openid-connect	oidc-full-name-mapper	\N	9d0cab5c-afcc-4ea3-b101-4d42e4d415b2
4ea2a40d-6a50-404b-8bda-564a57eaf3df	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	9d0cab5c-afcc-4ea3-b101-4d42e4d415b2
798c9f40-8555-453d-adca-0defe00d64f4	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	9d0cab5c-afcc-4ea3-b101-4d42e4d415b2
f2c03f77-97a4-4cc2-a439-b409492236c9	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	9d0cab5c-afcc-4ea3-b101-4d42e4d415b2
b54d9b85-2612-476b-8fa7-27e642fcfa75	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	9d0cab5c-afcc-4ea3-b101-4d42e4d415b2
b19b256d-374f-442d-a5a5-3724c4bbe1f8	username	openid-connect	oidc-usermodel-attribute-mapper	\N	9d0cab5c-afcc-4ea3-b101-4d42e4d415b2
f330671e-1e94-4ebc-bc52-55e9ab1c67a1	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	9d0cab5c-afcc-4ea3-b101-4d42e4d415b2
f8c1e13b-6e72-4a02-a5b2-dc6bad131839	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	9d0cab5c-afcc-4ea3-b101-4d42e4d415b2
fd426410-3320-4deb-aed1-41b53b6d7acc	website	openid-connect	oidc-usermodel-attribute-mapper	\N	9d0cab5c-afcc-4ea3-b101-4d42e4d415b2
68859394-870f-4fab-b870-5f6f053a9205	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	9d0cab5c-afcc-4ea3-b101-4d42e4d415b2
69d8da85-155a-483a-8f2d-2ba76d5c5e30	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	9d0cab5c-afcc-4ea3-b101-4d42e4d415b2
a15ff324-09e0-4568-bec1-0645252a88ac	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	9d0cab5c-afcc-4ea3-b101-4d42e4d415b2
07d12f67-c1ea-4a8a-909b-92929b3f04e2	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	9d0cab5c-afcc-4ea3-b101-4d42e4d415b2
d7f9a02e-e276-42b2-8f13-92a202f322e3	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	9d0cab5c-afcc-4ea3-b101-4d42e4d415b2
e0eacfbe-af07-4d5c-b161-5cebe647e756	email	openid-connect	oidc-usermodel-attribute-mapper	\N	04c9d566-ca21-4661-8fbf-5799d55c26f6
fc15c6d9-3059-48c9-aba7-36146f5d60c0	email verified	openid-connect	oidc-usermodel-property-mapper	\N	04c9d566-ca21-4661-8fbf-5799d55c26f6
1a3c5391-1631-4849-99e8-9778ec5f3552	address	openid-connect	oidc-address-mapper	\N	b8a91147-c5d1-4e67-a0ab-9330c21282bf
3147c61c-e19e-4b70-989c-16bee2a8847c	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	58c267c8-9d53-4a9e-84d1-0b0b9e92dd13
7f6c9f53-7af5-498f-8620-59dd71c138cd	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	58c267c8-9d53-4a9e-84d1-0b0b9e92dd13
8d254b1e-beec-496e-b84e-1ba457c8e83c	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	e04180aa-d199-4222-84a2-ab487af4f458
cd065a9f-1e47-496d-92fd-b96734c99fdd	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	e04180aa-d199-4222-84a2-ab487af4f458
5a0d013c-60bc-486c-94f4-b239488fab35	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	e04180aa-d199-4222-84a2-ab487af4f458
1b9d57db-063d-4d21-a2fa-5abf71470bc5	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	04f2206f-661d-43d4-b105-b87888d229dc
ed8f3a88-b4b2-45e2-9b55-b4c665bf2d54	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	f54d7cfb-b527-41b2-a361-be78068b8512
771de543-3944-46a3-abaf-f04ae0ba5d71	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	f54d7cfb-b527-41b2-a361-be78068b8512
39b79d7b-c126-46f5-8a9e-c7ae71bb50b0	acr loa level	openid-connect	oidc-acr-mapper	\N	05cb7b86-5530-43d9-84a2-596f3b5c2cf0
992af6ac-65fd-4b6e-aa4d-94f39523c0c3	audience resolve	openid-connect	oidc-audience-resolve-mapper	fa9559f2-8a34-402c-a370-5baa577d06e5	\N
6b55b465-9175-480f-a3a8-7b740e182557	role list	saml	saml-role-list-mapper	\N	f105853c-ec32-4b4b-ac69-b85293c78129
c20b5e0e-38a9-444c-ba68-befaca0d6a90	full name	openid-connect	oidc-full-name-mapper	\N	f8514664-5046-4036-9448-5ea49690ca37
ad81bc98-d0e3-45f1-80c4-c8be18d1da6a	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	f8514664-5046-4036-9448-5ea49690ca37
f52ec767-8bb9-4547-b6ba-8f3e1a87f55d	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	f8514664-5046-4036-9448-5ea49690ca37
263a2d3e-253c-44f8-878c-79b7c580fbcf	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	f8514664-5046-4036-9448-5ea49690ca37
c271cf4a-2a04-4422-a313-e02a2408ab25	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	f8514664-5046-4036-9448-5ea49690ca37
29488e48-cf40-4223-b24f-1cbd8405dc7c	username	openid-connect	oidc-usermodel-attribute-mapper	\N	f8514664-5046-4036-9448-5ea49690ca37
a3ea93ae-f8e9-4ac1-b3f7-7bd30398c907	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	f8514664-5046-4036-9448-5ea49690ca37
d4d0e47d-c5b9-4f0a-a28e-1989cd9b4dea	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	f8514664-5046-4036-9448-5ea49690ca37
bf621070-2ad3-4ba9-bd2a-a764c3fdeac4	website	openid-connect	oidc-usermodel-attribute-mapper	\N	f8514664-5046-4036-9448-5ea49690ca37
98f5b258-fb57-46cb-ae5a-c420f851b9a3	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	f8514664-5046-4036-9448-5ea49690ca37
d0e73fef-1ac8-4650-a997-890c28d363b1	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	f8514664-5046-4036-9448-5ea49690ca37
e5823011-a957-403b-9dec-51a18da12227	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	f8514664-5046-4036-9448-5ea49690ca37
f803990a-35a7-44b3-a9d6-30331689371a	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	f8514664-5046-4036-9448-5ea49690ca37
938a8039-50fc-490b-9289-977cf5458d96	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	f8514664-5046-4036-9448-5ea49690ca37
e336a742-5fd8-44f6-9ee6-adbb797e7e27	email	openid-connect	oidc-usermodel-attribute-mapper	\N	4f6ddbd6-8190-490c-98b6-81fbbbd67b06
db210390-1251-45c0-ba3b-2e66f121e292	email verified	openid-connect	oidc-usermodel-property-mapper	\N	4f6ddbd6-8190-490c-98b6-81fbbbd67b06
aa5fc7e0-e3ee-4207-a90a-8070068c790d	address	openid-connect	oidc-address-mapper	\N	83ffa6b9-c992-40aa-83c8-4b70d71100a7
a05ece86-bf83-4639-8bc6-024e7f4c4b6f	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	f9fff078-cc2c-414d-a768-1049b42ad6ee
2b1c6f83-2321-4260-836a-be3dd8709d3b	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	f9fff078-cc2c-414d-a768-1049b42ad6ee
24e3f881-76a3-4cdc-9b8e-fefc3fd873b8	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	2495d8ed-1b04-4f77-8425-5e74f89d364e
c563da81-039a-4583-8df3-e11d1bcea264	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	2495d8ed-1b04-4f77-8425-5e74f89d364e
5d6c1e2d-da1d-4f36-93c6-10ef9562f29d	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	2495d8ed-1b04-4f77-8425-5e74f89d364e
98969626-daa8-44fb-a3da-82352828353a	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	851dc12f-6d81-402b-99a9-489735752570
b82a92ba-f52f-4d7b-b849-5887acec3aaf	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	f2fba91a-7d8d-435e-b1d6-75d49744cf4a
0dfae46b-0859-4369-9b46-63fa7072e355	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	f2fba91a-7d8d-435e-b1d6-75d49744cf4a
6bb0269a-6b08-4f1f-a45f-828c466b9573	acr loa level	openid-connect	oidc-acr-mapper	\N	30b18b0a-c2b0-42cb-8070-affa9097da22
879f62bc-5ed3-415b-bf67-dd5e4f62337a	locale	openid-connect	oidc-usermodel-attribute-mapper	f87a998e-f2d4-40f8-889a-e94ac271f609	\N
afb4f6c7-2cb5-4704-bb92-fbbaa9426927	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	ccb6b605-1a41-4064-b9ec-659b971d96d8	\N
d784bac7-c5b9-4276-9627-a7b62e5cc4de	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	ccb6b605-1a41-4064-b9ec-659b971d96d8	\N
09f734b2-401d-4d48-81fa-4a924519dd5d	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	ccb6b605-1a41-4064-b9ec-659b971d96d8	\N
4537c3e1-bf0b-4068-b310-754c27ef315d	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	35749ab8-4b2b-4d71-b8b3-2bf8b346f836	\N
3d5508e4-f412-40ab-98bb-a839fa7b104b	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	35749ab8-4b2b-4d71-b8b3-2bf8b346f836	\N
bf31c16d-5021-40c5-ba45-b359974b4f4f	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	35749ab8-4b2b-4d71-b8b3-2bf8b346f836	\N
\.


--
-- TOC entry 4180 (class 0 OID 16801)
-- Dependencies: 245
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
f595c5b8-7bf6-48a4-8ee7-9aa6b5a70492	true	userinfo.token.claim
f595c5b8-7bf6-48a4-8ee7-9aa6b5a70492	locale	user.attribute
f595c5b8-7bf6-48a4-8ee7-9aa6b5a70492	true	id.token.claim
f595c5b8-7bf6-48a4-8ee7-9aa6b5a70492	true	access.token.claim
f595c5b8-7bf6-48a4-8ee7-9aa6b5a70492	locale	claim.name
f595c5b8-7bf6-48a4-8ee7-9aa6b5a70492	String	jsonType.label
2e53a0d9-a422-4154-b3ed-3f1579e2b994	false	single
2e53a0d9-a422-4154-b3ed-3f1579e2b994	Basic	attribute.nameformat
2e53a0d9-a422-4154-b3ed-3f1579e2b994	Role	attribute.name
07d12f67-c1ea-4a8a-909b-92929b3f04e2	true	userinfo.token.claim
07d12f67-c1ea-4a8a-909b-92929b3f04e2	locale	user.attribute
07d12f67-c1ea-4a8a-909b-92929b3f04e2	true	id.token.claim
07d12f67-c1ea-4a8a-909b-92929b3f04e2	true	access.token.claim
07d12f67-c1ea-4a8a-909b-92929b3f04e2	locale	claim.name
07d12f67-c1ea-4a8a-909b-92929b3f04e2	String	jsonType.label
4ea2a40d-6a50-404b-8bda-564a57eaf3df	true	userinfo.token.claim
4ea2a40d-6a50-404b-8bda-564a57eaf3df	lastName	user.attribute
4ea2a40d-6a50-404b-8bda-564a57eaf3df	true	id.token.claim
4ea2a40d-6a50-404b-8bda-564a57eaf3df	true	access.token.claim
4ea2a40d-6a50-404b-8bda-564a57eaf3df	family_name	claim.name
4ea2a40d-6a50-404b-8bda-564a57eaf3df	String	jsonType.label
58350aa2-426e-4d07-bdb3-0f7837d58cd0	true	userinfo.token.claim
58350aa2-426e-4d07-bdb3-0f7837d58cd0	true	id.token.claim
58350aa2-426e-4d07-bdb3-0f7837d58cd0	true	access.token.claim
68859394-870f-4fab-b870-5f6f053a9205	true	userinfo.token.claim
68859394-870f-4fab-b870-5f6f053a9205	gender	user.attribute
68859394-870f-4fab-b870-5f6f053a9205	true	id.token.claim
68859394-870f-4fab-b870-5f6f053a9205	true	access.token.claim
68859394-870f-4fab-b870-5f6f053a9205	gender	claim.name
68859394-870f-4fab-b870-5f6f053a9205	String	jsonType.label
69d8da85-155a-483a-8f2d-2ba76d5c5e30	true	userinfo.token.claim
69d8da85-155a-483a-8f2d-2ba76d5c5e30	birthdate	user.attribute
69d8da85-155a-483a-8f2d-2ba76d5c5e30	true	id.token.claim
69d8da85-155a-483a-8f2d-2ba76d5c5e30	true	access.token.claim
69d8da85-155a-483a-8f2d-2ba76d5c5e30	birthdate	claim.name
69d8da85-155a-483a-8f2d-2ba76d5c5e30	String	jsonType.label
798c9f40-8555-453d-adca-0defe00d64f4	true	userinfo.token.claim
798c9f40-8555-453d-adca-0defe00d64f4	firstName	user.attribute
798c9f40-8555-453d-adca-0defe00d64f4	true	id.token.claim
798c9f40-8555-453d-adca-0defe00d64f4	true	access.token.claim
798c9f40-8555-453d-adca-0defe00d64f4	given_name	claim.name
798c9f40-8555-453d-adca-0defe00d64f4	String	jsonType.label
a15ff324-09e0-4568-bec1-0645252a88ac	true	userinfo.token.claim
a15ff324-09e0-4568-bec1-0645252a88ac	zoneinfo	user.attribute
a15ff324-09e0-4568-bec1-0645252a88ac	true	id.token.claim
a15ff324-09e0-4568-bec1-0645252a88ac	true	access.token.claim
a15ff324-09e0-4568-bec1-0645252a88ac	zoneinfo	claim.name
a15ff324-09e0-4568-bec1-0645252a88ac	String	jsonType.label
b19b256d-374f-442d-a5a5-3724c4bbe1f8	true	userinfo.token.claim
b19b256d-374f-442d-a5a5-3724c4bbe1f8	username	user.attribute
b19b256d-374f-442d-a5a5-3724c4bbe1f8	true	id.token.claim
b19b256d-374f-442d-a5a5-3724c4bbe1f8	true	access.token.claim
b19b256d-374f-442d-a5a5-3724c4bbe1f8	preferred_username	claim.name
b19b256d-374f-442d-a5a5-3724c4bbe1f8	String	jsonType.label
b54d9b85-2612-476b-8fa7-27e642fcfa75	true	userinfo.token.claim
b54d9b85-2612-476b-8fa7-27e642fcfa75	nickname	user.attribute
b54d9b85-2612-476b-8fa7-27e642fcfa75	true	id.token.claim
b54d9b85-2612-476b-8fa7-27e642fcfa75	true	access.token.claim
b54d9b85-2612-476b-8fa7-27e642fcfa75	nickname	claim.name
b54d9b85-2612-476b-8fa7-27e642fcfa75	String	jsonType.label
d7f9a02e-e276-42b2-8f13-92a202f322e3	true	userinfo.token.claim
d7f9a02e-e276-42b2-8f13-92a202f322e3	updatedAt	user.attribute
d7f9a02e-e276-42b2-8f13-92a202f322e3	true	id.token.claim
d7f9a02e-e276-42b2-8f13-92a202f322e3	true	access.token.claim
d7f9a02e-e276-42b2-8f13-92a202f322e3	updated_at	claim.name
d7f9a02e-e276-42b2-8f13-92a202f322e3	long	jsonType.label
f2c03f77-97a4-4cc2-a439-b409492236c9	true	userinfo.token.claim
f2c03f77-97a4-4cc2-a439-b409492236c9	middleName	user.attribute
f2c03f77-97a4-4cc2-a439-b409492236c9	true	id.token.claim
f2c03f77-97a4-4cc2-a439-b409492236c9	true	access.token.claim
f2c03f77-97a4-4cc2-a439-b409492236c9	middle_name	claim.name
f2c03f77-97a4-4cc2-a439-b409492236c9	String	jsonType.label
f330671e-1e94-4ebc-bc52-55e9ab1c67a1	true	userinfo.token.claim
f330671e-1e94-4ebc-bc52-55e9ab1c67a1	profile	user.attribute
f330671e-1e94-4ebc-bc52-55e9ab1c67a1	true	id.token.claim
f330671e-1e94-4ebc-bc52-55e9ab1c67a1	true	access.token.claim
f330671e-1e94-4ebc-bc52-55e9ab1c67a1	profile	claim.name
f330671e-1e94-4ebc-bc52-55e9ab1c67a1	String	jsonType.label
f8c1e13b-6e72-4a02-a5b2-dc6bad131839	true	userinfo.token.claim
f8c1e13b-6e72-4a02-a5b2-dc6bad131839	picture	user.attribute
f8c1e13b-6e72-4a02-a5b2-dc6bad131839	true	id.token.claim
f8c1e13b-6e72-4a02-a5b2-dc6bad131839	true	access.token.claim
f8c1e13b-6e72-4a02-a5b2-dc6bad131839	picture	claim.name
f8c1e13b-6e72-4a02-a5b2-dc6bad131839	String	jsonType.label
fd426410-3320-4deb-aed1-41b53b6d7acc	true	userinfo.token.claim
fd426410-3320-4deb-aed1-41b53b6d7acc	website	user.attribute
fd426410-3320-4deb-aed1-41b53b6d7acc	true	id.token.claim
fd426410-3320-4deb-aed1-41b53b6d7acc	true	access.token.claim
fd426410-3320-4deb-aed1-41b53b6d7acc	website	claim.name
fd426410-3320-4deb-aed1-41b53b6d7acc	String	jsonType.label
e0eacfbe-af07-4d5c-b161-5cebe647e756	true	userinfo.token.claim
e0eacfbe-af07-4d5c-b161-5cebe647e756	email	user.attribute
e0eacfbe-af07-4d5c-b161-5cebe647e756	true	id.token.claim
e0eacfbe-af07-4d5c-b161-5cebe647e756	true	access.token.claim
e0eacfbe-af07-4d5c-b161-5cebe647e756	email	claim.name
e0eacfbe-af07-4d5c-b161-5cebe647e756	String	jsonType.label
fc15c6d9-3059-48c9-aba7-36146f5d60c0	true	userinfo.token.claim
fc15c6d9-3059-48c9-aba7-36146f5d60c0	emailVerified	user.attribute
fc15c6d9-3059-48c9-aba7-36146f5d60c0	true	id.token.claim
fc15c6d9-3059-48c9-aba7-36146f5d60c0	true	access.token.claim
fc15c6d9-3059-48c9-aba7-36146f5d60c0	email_verified	claim.name
fc15c6d9-3059-48c9-aba7-36146f5d60c0	boolean	jsonType.label
1a3c5391-1631-4849-99e8-9778ec5f3552	formatted	user.attribute.formatted
1a3c5391-1631-4849-99e8-9778ec5f3552	country	user.attribute.country
1a3c5391-1631-4849-99e8-9778ec5f3552	postal_code	user.attribute.postal_code
1a3c5391-1631-4849-99e8-9778ec5f3552	true	userinfo.token.claim
1a3c5391-1631-4849-99e8-9778ec5f3552	street	user.attribute.street
1a3c5391-1631-4849-99e8-9778ec5f3552	true	id.token.claim
1a3c5391-1631-4849-99e8-9778ec5f3552	region	user.attribute.region
1a3c5391-1631-4849-99e8-9778ec5f3552	true	access.token.claim
1a3c5391-1631-4849-99e8-9778ec5f3552	locality	user.attribute.locality
3147c61c-e19e-4b70-989c-16bee2a8847c	true	userinfo.token.claim
3147c61c-e19e-4b70-989c-16bee2a8847c	phoneNumber	user.attribute
3147c61c-e19e-4b70-989c-16bee2a8847c	true	id.token.claim
3147c61c-e19e-4b70-989c-16bee2a8847c	true	access.token.claim
3147c61c-e19e-4b70-989c-16bee2a8847c	phone_number	claim.name
3147c61c-e19e-4b70-989c-16bee2a8847c	String	jsonType.label
7f6c9f53-7af5-498f-8620-59dd71c138cd	true	userinfo.token.claim
7f6c9f53-7af5-498f-8620-59dd71c138cd	phoneNumberVerified	user.attribute
7f6c9f53-7af5-498f-8620-59dd71c138cd	true	id.token.claim
7f6c9f53-7af5-498f-8620-59dd71c138cd	true	access.token.claim
7f6c9f53-7af5-498f-8620-59dd71c138cd	phone_number_verified	claim.name
7f6c9f53-7af5-498f-8620-59dd71c138cd	boolean	jsonType.label
8d254b1e-beec-496e-b84e-1ba457c8e83c	true	multivalued
8d254b1e-beec-496e-b84e-1ba457c8e83c	foo	user.attribute
8d254b1e-beec-496e-b84e-1ba457c8e83c	true	access.token.claim
8d254b1e-beec-496e-b84e-1ba457c8e83c	realm_access.roles	claim.name
8d254b1e-beec-496e-b84e-1ba457c8e83c	String	jsonType.label
cd065a9f-1e47-496d-92fd-b96734c99fdd	true	multivalued
cd065a9f-1e47-496d-92fd-b96734c99fdd	foo	user.attribute
cd065a9f-1e47-496d-92fd-b96734c99fdd	true	access.token.claim
cd065a9f-1e47-496d-92fd-b96734c99fdd	resource_access.${client_id}.roles	claim.name
cd065a9f-1e47-496d-92fd-b96734c99fdd	String	jsonType.label
771de543-3944-46a3-abaf-f04ae0ba5d71	true	multivalued
771de543-3944-46a3-abaf-f04ae0ba5d71	foo	user.attribute
771de543-3944-46a3-abaf-f04ae0ba5d71	true	id.token.claim
771de543-3944-46a3-abaf-f04ae0ba5d71	true	access.token.claim
771de543-3944-46a3-abaf-f04ae0ba5d71	groups	claim.name
771de543-3944-46a3-abaf-f04ae0ba5d71	String	jsonType.label
ed8f3a88-b4b2-45e2-9b55-b4c665bf2d54	true	userinfo.token.claim
ed8f3a88-b4b2-45e2-9b55-b4c665bf2d54	username	user.attribute
ed8f3a88-b4b2-45e2-9b55-b4c665bf2d54	true	id.token.claim
ed8f3a88-b4b2-45e2-9b55-b4c665bf2d54	true	access.token.claim
ed8f3a88-b4b2-45e2-9b55-b4c665bf2d54	upn	claim.name
ed8f3a88-b4b2-45e2-9b55-b4c665bf2d54	String	jsonType.label
39b79d7b-c126-46f5-8a9e-c7ae71bb50b0	true	id.token.claim
39b79d7b-c126-46f5-8a9e-c7ae71bb50b0	true	access.token.claim
6b55b465-9175-480f-a3a8-7b740e182557	false	single
6b55b465-9175-480f-a3a8-7b740e182557	Basic	attribute.nameformat
6b55b465-9175-480f-a3a8-7b740e182557	Role	attribute.name
263a2d3e-253c-44f8-878c-79b7c580fbcf	true	userinfo.token.claim
263a2d3e-253c-44f8-878c-79b7c580fbcf	middleName	user.attribute
263a2d3e-253c-44f8-878c-79b7c580fbcf	true	id.token.claim
263a2d3e-253c-44f8-878c-79b7c580fbcf	true	access.token.claim
263a2d3e-253c-44f8-878c-79b7c580fbcf	middle_name	claim.name
263a2d3e-253c-44f8-878c-79b7c580fbcf	String	jsonType.label
29488e48-cf40-4223-b24f-1cbd8405dc7c	true	userinfo.token.claim
29488e48-cf40-4223-b24f-1cbd8405dc7c	username	user.attribute
29488e48-cf40-4223-b24f-1cbd8405dc7c	true	id.token.claim
29488e48-cf40-4223-b24f-1cbd8405dc7c	true	access.token.claim
29488e48-cf40-4223-b24f-1cbd8405dc7c	preferred_username	claim.name
29488e48-cf40-4223-b24f-1cbd8405dc7c	String	jsonType.label
938a8039-50fc-490b-9289-977cf5458d96	true	userinfo.token.claim
938a8039-50fc-490b-9289-977cf5458d96	updatedAt	user.attribute
938a8039-50fc-490b-9289-977cf5458d96	true	id.token.claim
938a8039-50fc-490b-9289-977cf5458d96	true	access.token.claim
938a8039-50fc-490b-9289-977cf5458d96	updated_at	claim.name
938a8039-50fc-490b-9289-977cf5458d96	long	jsonType.label
98f5b258-fb57-46cb-ae5a-c420f851b9a3	true	userinfo.token.claim
98f5b258-fb57-46cb-ae5a-c420f851b9a3	gender	user.attribute
98f5b258-fb57-46cb-ae5a-c420f851b9a3	true	id.token.claim
98f5b258-fb57-46cb-ae5a-c420f851b9a3	true	access.token.claim
98f5b258-fb57-46cb-ae5a-c420f851b9a3	gender	claim.name
98f5b258-fb57-46cb-ae5a-c420f851b9a3	String	jsonType.label
a3ea93ae-f8e9-4ac1-b3f7-7bd30398c907	true	userinfo.token.claim
a3ea93ae-f8e9-4ac1-b3f7-7bd30398c907	profile	user.attribute
a3ea93ae-f8e9-4ac1-b3f7-7bd30398c907	true	id.token.claim
a3ea93ae-f8e9-4ac1-b3f7-7bd30398c907	true	access.token.claim
a3ea93ae-f8e9-4ac1-b3f7-7bd30398c907	profile	claim.name
a3ea93ae-f8e9-4ac1-b3f7-7bd30398c907	String	jsonType.label
ad81bc98-d0e3-45f1-80c4-c8be18d1da6a	true	userinfo.token.claim
ad81bc98-d0e3-45f1-80c4-c8be18d1da6a	lastName	user.attribute
ad81bc98-d0e3-45f1-80c4-c8be18d1da6a	true	id.token.claim
ad81bc98-d0e3-45f1-80c4-c8be18d1da6a	true	access.token.claim
ad81bc98-d0e3-45f1-80c4-c8be18d1da6a	family_name	claim.name
ad81bc98-d0e3-45f1-80c4-c8be18d1da6a	String	jsonType.label
bf621070-2ad3-4ba9-bd2a-a764c3fdeac4	true	userinfo.token.claim
bf621070-2ad3-4ba9-bd2a-a764c3fdeac4	website	user.attribute
bf621070-2ad3-4ba9-bd2a-a764c3fdeac4	true	id.token.claim
bf621070-2ad3-4ba9-bd2a-a764c3fdeac4	true	access.token.claim
bf621070-2ad3-4ba9-bd2a-a764c3fdeac4	website	claim.name
bf621070-2ad3-4ba9-bd2a-a764c3fdeac4	String	jsonType.label
c20b5e0e-38a9-444c-ba68-befaca0d6a90	true	userinfo.token.claim
c20b5e0e-38a9-444c-ba68-befaca0d6a90	true	id.token.claim
c20b5e0e-38a9-444c-ba68-befaca0d6a90	true	access.token.claim
c271cf4a-2a04-4422-a313-e02a2408ab25	true	userinfo.token.claim
c271cf4a-2a04-4422-a313-e02a2408ab25	nickname	user.attribute
c271cf4a-2a04-4422-a313-e02a2408ab25	true	id.token.claim
c271cf4a-2a04-4422-a313-e02a2408ab25	true	access.token.claim
c271cf4a-2a04-4422-a313-e02a2408ab25	nickname	claim.name
c271cf4a-2a04-4422-a313-e02a2408ab25	String	jsonType.label
d0e73fef-1ac8-4650-a997-890c28d363b1	true	userinfo.token.claim
d0e73fef-1ac8-4650-a997-890c28d363b1	birthdate	user.attribute
d0e73fef-1ac8-4650-a997-890c28d363b1	true	id.token.claim
d0e73fef-1ac8-4650-a997-890c28d363b1	true	access.token.claim
d0e73fef-1ac8-4650-a997-890c28d363b1	birthdate	claim.name
d0e73fef-1ac8-4650-a997-890c28d363b1	String	jsonType.label
d4d0e47d-c5b9-4f0a-a28e-1989cd9b4dea	true	userinfo.token.claim
d4d0e47d-c5b9-4f0a-a28e-1989cd9b4dea	picture	user.attribute
d4d0e47d-c5b9-4f0a-a28e-1989cd9b4dea	true	id.token.claim
d4d0e47d-c5b9-4f0a-a28e-1989cd9b4dea	true	access.token.claim
d4d0e47d-c5b9-4f0a-a28e-1989cd9b4dea	picture	claim.name
d4d0e47d-c5b9-4f0a-a28e-1989cd9b4dea	String	jsonType.label
e5823011-a957-403b-9dec-51a18da12227	true	userinfo.token.claim
e5823011-a957-403b-9dec-51a18da12227	zoneinfo	user.attribute
e5823011-a957-403b-9dec-51a18da12227	true	id.token.claim
e5823011-a957-403b-9dec-51a18da12227	true	access.token.claim
e5823011-a957-403b-9dec-51a18da12227	zoneinfo	claim.name
e5823011-a957-403b-9dec-51a18da12227	String	jsonType.label
f52ec767-8bb9-4547-b6ba-8f3e1a87f55d	true	userinfo.token.claim
f52ec767-8bb9-4547-b6ba-8f3e1a87f55d	firstName	user.attribute
f52ec767-8bb9-4547-b6ba-8f3e1a87f55d	true	id.token.claim
f52ec767-8bb9-4547-b6ba-8f3e1a87f55d	true	access.token.claim
f52ec767-8bb9-4547-b6ba-8f3e1a87f55d	given_name	claim.name
f52ec767-8bb9-4547-b6ba-8f3e1a87f55d	String	jsonType.label
f803990a-35a7-44b3-a9d6-30331689371a	true	userinfo.token.claim
f803990a-35a7-44b3-a9d6-30331689371a	locale	user.attribute
f803990a-35a7-44b3-a9d6-30331689371a	true	id.token.claim
f803990a-35a7-44b3-a9d6-30331689371a	true	access.token.claim
f803990a-35a7-44b3-a9d6-30331689371a	locale	claim.name
f803990a-35a7-44b3-a9d6-30331689371a	String	jsonType.label
db210390-1251-45c0-ba3b-2e66f121e292	true	userinfo.token.claim
db210390-1251-45c0-ba3b-2e66f121e292	emailVerified	user.attribute
db210390-1251-45c0-ba3b-2e66f121e292	true	id.token.claim
db210390-1251-45c0-ba3b-2e66f121e292	true	access.token.claim
db210390-1251-45c0-ba3b-2e66f121e292	email_verified	claim.name
db210390-1251-45c0-ba3b-2e66f121e292	boolean	jsonType.label
e336a742-5fd8-44f6-9ee6-adbb797e7e27	true	userinfo.token.claim
e336a742-5fd8-44f6-9ee6-adbb797e7e27	email	user.attribute
e336a742-5fd8-44f6-9ee6-adbb797e7e27	true	id.token.claim
e336a742-5fd8-44f6-9ee6-adbb797e7e27	true	access.token.claim
e336a742-5fd8-44f6-9ee6-adbb797e7e27	email	claim.name
e336a742-5fd8-44f6-9ee6-adbb797e7e27	String	jsonType.label
aa5fc7e0-e3ee-4207-a90a-8070068c790d	formatted	user.attribute.formatted
aa5fc7e0-e3ee-4207-a90a-8070068c790d	country	user.attribute.country
aa5fc7e0-e3ee-4207-a90a-8070068c790d	postal_code	user.attribute.postal_code
aa5fc7e0-e3ee-4207-a90a-8070068c790d	true	userinfo.token.claim
aa5fc7e0-e3ee-4207-a90a-8070068c790d	street	user.attribute.street
aa5fc7e0-e3ee-4207-a90a-8070068c790d	true	id.token.claim
aa5fc7e0-e3ee-4207-a90a-8070068c790d	region	user.attribute.region
aa5fc7e0-e3ee-4207-a90a-8070068c790d	true	access.token.claim
aa5fc7e0-e3ee-4207-a90a-8070068c790d	locality	user.attribute.locality
2b1c6f83-2321-4260-836a-be3dd8709d3b	true	userinfo.token.claim
2b1c6f83-2321-4260-836a-be3dd8709d3b	phoneNumberVerified	user.attribute
2b1c6f83-2321-4260-836a-be3dd8709d3b	true	id.token.claim
2b1c6f83-2321-4260-836a-be3dd8709d3b	true	access.token.claim
2b1c6f83-2321-4260-836a-be3dd8709d3b	phone_number_verified	claim.name
2b1c6f83-2321-4260-836a-be3dd8709d3b	boolean	jsonType.label
a05ece86-bf83-4639-8bc6-024e7f4c4b6f	true	userinfo.token.claim
a05ece86-bf83-4639-8bc6-024e7f4c4b6f	phoneNumber	user.attribute
a05ece86-bf83-4639-8bc6-024e7f4c4b6f	true	id.token.claim
a05ece86-bf83-4639-8bc6-024e7f4c4b6f	true	access.token.claim
a05ece86-bf83-4639-8bc6-024e7f4c4b6f	phone_number	claim.name
a05ece86-bf83-4639-8bc6-024e7f4c4b6f	String	jsonType.label
24e3f881-76a3-4cdc-9b8e-fefc3fd873b8	true	multivalued
24e3f881-76a3-4cdc-9b8e-fefc3fd873b8	foo	user.attribute
24e3f881-76a3-4cdc-9b8e-fefc3fd873b8	true	access.token.claim
24e3f881-76a3-4cdc-9b8e-fefc3fd873b8	realm_access.roles	claim.name
24e3f881-76a3-4cdc-9b8e-fefc3fd873b8	String	jsonType.label
c563da81-039a-4583-8df3-e11d1bcea264	true	multivalued
c563da81-039a-4583-8df3-e11d1bcea264	foo	user.attribute
c563da81-039a-4583-8df3-e11d1bcea264	true	access.token.claim
c563da81-039a-4583-8df3-e11d1bcea264	resource_access.${client_id}.roles	claim.name
c563da81-039a-4583-8df3-e11d1bcea264	String	jsonType.label
0dfae46b-0859-4369-9b46-63fa7072e355	true	multivalued
0dfae46b-0859-4369-9b46-63fa7072e355	foo	user.attribute
0dfae46b-0859-4369-9b46-63fa7072e355	true	id.token.claim
0dfae46b-0859-4369-9b46-63fa7072e355	true	access.token.claim
0dfae46b-0859-4369-9b46-63fa7072e355	groups	claim.name
0dfae46b-0859-4369-9b46-63fa7072e355	String	jsonType.label
b82a92ba-f52f-4d7b-b849-5887acec3aaf	true	userinfo.token.claim
b82a92ba-f52f-4d7b-b849-5887acec3aaf	username	user.attribute
b82a92ba-f52f-4d7b-b849-5887acec3aaf	true	id.token.claim
b82a92ba-f52f-4d7b-b849-5887acec3aaf	true	access.token.claim
b82a92ba-f52f-4d7b-b849-5887acec3aaf	upn	claim.name
b82a92ba-f52f-4d7b-b849-5887acec3aaf	String	jsonType.label
6bb0269a-6b08-4f1f-a45f-828c466b9573	true	id.token.claim
6bb0269a-6b08-4f1f-a45f-828c466b9573	true	access.token.claim
879f62bc-5ed3-415b-bf67-dd5e4f62337a	true	userinfo.token.claim
879f62bc-5ed3-415b-bf67-dd5e4f62337a	locale	user.attribute
879f62bc-5ed3-415b-bf67-dd5e4f62337a	true	id.token.claim
879f62bc-5ed3-415b-bf67-dd5e4f62337a	true	access.token.claim
879f62bc-5ed3-415b-bf67-dd5e4f62337a	locale	claim.name
879f62bc-5ed3-415b-bf67-dd5e4f62337a	String	jsonType.label
09f734b2-401d-4d48-81fa-4a924519dd5d	clientAddress	user.session.note
09f734b2-401d-4d48-81fa-4a924519dd5d	true	id.token.claim
09f734b2-401d-4d48-81fa-4a924519dd5d	true	access.token.claim
09f734b2-401d-4d48-81fa-4a924519dd5d	clientAddress	claim.name
09f734b2-401d-4d48-81fa-4a924519dd5d	String	jsonType.label
afb4f6c7-2cb5-4704-bb92-fbbaa9426927	client_id	user.session.note
afb4f6c7-2cb5-4704-bb92-fbbaa9426927	true	id.token.claim
afb4f6c7-2cb5-4704-bb92-fbbaa9426927	true	access.token.claim
afb4f6c7-2cb5-4704-bb92-fbbaa9426927	client_id	claim.name
afb4f6c7-2cb5-4704-bb92-fbbaa9426927	String	jsonType.label
d784bac7-c5b9-4276-9627-a7b62e5cc4de	clientHost	user.session.note
d784bac7-c5b9-4276-9627-a7b62e5cc4de	true	id.token.claim
d784bac7-c5b9-4276-9627-a7b62e5cc4de	true	access.token.claim
d784bac7-c5b9-4276-9627-a7b62e5cc4de	clientHost	claim.name
d784bac7-c5b9-4276-9627-a7b62e5cc4de	String	jsonType.label
3d5508e4-f412-40ab-98bb-a839fa7b104b	clientHost	user.session.note
3d5508e4-f412-40ab-98bb-a839fa7b104b	true	id.token.claim
3d5508e4-f412-40ab-98bb-a839fa7b104b	true	access.token.claim
3d5508e4-f412-40ab-98bb-a839fa7b104b	clientHost	claim.name
3d5508e4-f412-40ab-98bb-a839fa7b104b	String	jsonType.label
4537c3e1-bf0b-4068-b310-754c27ef315d	client_id	user.session.note
4537c3e1-bf0b-4068-b310-754c27ef315d	true	id.token.claim
4537c3e1-bf0b-4068-b310-754c27ef315d	true	access.token.claim
4537c3e1-bf0b-4068-b310-754c27ef315d	client_id	claim.name
4537c3e1-bf0b-4068-b310-754c27ef315d	String	jsonType.label
bf31c16d-5021-40c5-ba45-b359974b4f4f	clientAddress	user.session.note
bf31c16d-5021-40c5-ba45-b359974b4f4f	true	id.token.claim
bf31c16d-5021-40c5-ba45-b359974b4f4f	true	access.token.claim
bf31c16d-5021-40c5-ba45-b359974b4f4f	clientAddress	claim.name
bf31c16d-5021-40c5-ba45-b359974b4f4f	String	jsonType.label
24e3f881-76a3-4cdc-9b8e-fefc3fd873b8	true	userinfo.token.claim
24e3f881-76a3-4cdc-9b8e-fefc3fd873b8	false	id.token.claim
c563da81-039a-4583-8df3-e11d1bcea264	true	userinfo.token.claim
c563da81-039a-4583-8df3-e11d1bcea264	false	id.token.claim
\.


--
-- TOC entry 4160 (class 0 OID 16443)
-- Dependencies: 225
-- Data for Name: realm; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
dbdc26c7-3f31-4332-bae9-a245a94f1c51	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	bc881421-2f5a-4038-8c43-e3301f49af4a	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	4d00a8e7-a858-45fa-849c-8b21d09ba34b	2fbfd389-9233-4973-bd35-232e5bad05fb	03363fc4-835d-4a9e-86f5-f837478b5b04	1bc65055-8c96-48a8-82e8-1581ba7c3ea9	b2f55077-8e56-4edf-ad3c-a88fa7dc9147	2592000	f	900	t	f	6d4ae779-fa2b-4510-be6e-7f9843be8284	0	f	0	0	91b63f58-c8c6-4f40-97e7-718f9692e901
e714c293-8916-447d-acec-a6202b90ae13	60	300	300	\N	\N	\N	t	f	0	\N	secure-client-realm	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	e3ef5fa4-3168-46c4-a11a-7b3b1d199b3b	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	8d144703-7546-4239-bc93-4ac2dff6e58a	d54dab90-8788-42b5-b1e9-674bab2dd267	06d8f350-000f-45f2-885e-6d718a487fdc	795368f4-bb8b-49cd-b18c-a286ab94ef02	02bff3de-ebce-4f17-86ee-926576ef70d6	2592000	f	900	t	f	2a71158f-343d-4e18-8a5d-f523b10c60be	0	f	0	0	c346a324-63f8-4d17-8afd-57237cbbb385
\.


--
-- TOC entry 4161 (class 0 OID 16460)
-- Dependencies: 226
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	dbdc26c7-3f31-4332-bae9-a245a94f1c51	
_browser_header.xContentTypeOptions	dbdc26c7-3f31-4332-bae9-a245a94f1c51	nosniff
_browser_header.referrerPolicy	dbdc26c7-3f31-4332-bae9-a245a94f1c51	no-referrer
_browser_header.xRobotsTag	dbdc26c7-3f31-4332-bae9-a245a94f1c51	none
_browser_header.xFrameOptions	dbdc26c7-3f31-4332-bae9-a245a94f1c51	SAMEORIGIN
_browser_header.contentSecurityPolicy	dbdc26c7-3f31-4332-bae9-a245a94f1c51	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	dbdc26c7-3f31-4332-bae9-a245a94f1c51	1; mode=block
_browser_header.strictTransportSecurity	dbdc26c7-3f31-4332-bae9-a245a94f1c51	max-age=31536000; includeSubDomains
bruteForceProtected	dbdc26c7-3f31-4332-bae9-a245a94f1c51	false
permanentLockout	dbdc26c7-3f31-4332-bae9-a245a94f1c51	false
maxFailureWaitSeconds	dbdc26c7-3f31-4332-bae9-a245a94f1c51	900
minimumQuickLoginWaitSeconds	dbdc26c7-3f31-4332-bae9-a245a94f1c51	60
waitIncrementSeconds	dbdc26c7-3f31-4332-bae9-a245a94f1c51	60
quickLoginCheckMilliSeconds	dbdc26c7-3f31-4332-bae9-a245a94f1c51	1000
maxDeltaTimeSeconds	dbdc26c7-3f31-4332-bae9-a245a94f1c51	43200
failureFactor	dbdc26c7-3f31-4332-bae9-a245a94f1c51	30
realmReusableOtpCode	dbdc26c7-3f31-4332-bae9-a245a94f1c51	false
displayName	dbdc26c7-3f31-4332-bae9-a245a94f1c51	Keycloak
displayNameHtml	dbdc26c7-3f31-4332-bae9-a245a94f1c51	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	dbdc26c7-3f31-4332-bae9-a245a94f1c51	RS256
offlineSessionMaxLifespanEnabled	dbdc26c7-3f31-4332-bae9-a245a94f1c51	false
offlineSessionMaxLifespan	dbdc26c7-3f31-4332-bae9-a245a94f1c51	5184000
_browser_header.contentSecurityPolicyReportOnly	e714c293-8916-447d-acec-a6202b90ae13	
_browser_header.xContentTypeOptions	e714c293-8916-447d-acec-a6202b90ae13	nosniff
_browser_header.referrerPolicy	e714c293-8916-447d-acec-a6202b90ae13	no-referrer
_browser_header.xRobotsTag	e714c293-8916-447d-acec-a6202b90ae13	none
_browser_header.xFrameOptions	e714c293-8916-447d-acec-a6202b90ae13	SAMEORIGIN
_browser_header.contentSecurityPolicy	e714c293-8916-447d-acec-a6202b90ae13	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	e714c293-8916-447d-acec-a6202b90ae13	1; mode=block
_browser_header.strictTransportSecurity	e714c293-8916-447d-acec-a6202b90ae13	max-age=31536000; includeSubDomains
bruteForceProtected	e714c293-8916-447d-acec-a6202b90ae13	false
permanentLockout	e714c293-8916-447d-acec-a6202b90ae13	false
maxFailureWaitSeconds	e714c293-8916-447d-acec-a6202b90ae13	900
minimumQuickLoginWaitSeconds	e714c293-8916-447d-acec-a6202b90ae13	60
waitIncrementSeconds	e714c293-8916-447d-acec-a6202b90ae13	60
quickLoginCheckMilliSeconds	e714c293-8916-447d-acec-a6202b90ae13	1000
maxDeltaTimeSeconds	e714c293-8916-447d-acec-a6202b90ae13	43200
failureFactor	e714c293-8916-447d-acec-a6202b90ae13	30
realmReusableOtpCode	e714c293-8916-447d-acec-a6202b90ae13	false
defaultSignatureAlgorithm	e714c293-8916-447d-acec-a6202b90ae13	RS256
offlineSessionMaxLifespanEnabled	e714c293-8916-447d-acec-a6202b90ae13	false
offlineSessionMaxLifespan	e714c293-8916-447d-acec-a6202b90ae13	5184000
actionTokenGeneratedByAdminLifespan	e714c293-8916-447d-acec-a6202b90ae13	43200
actionTokenGeneratedByUserLifespan	e714c293-8916-447d-acec-a6202b90ae13	300
oauth2DeviceCodeLifespan	e714c293-8916-447d-acec-a6202b90ae13	600
oauth2DevicePollingInterval	e714c293-8916-447d-acec-a6202b90ae13	5
webAuthnPolicyRpEntityName	e714c293-8916-447d-acec-a6202b90ae13	keycloak
webAuthnPolicySignatureAlgorithms	e714c293-8916-447d-acec-a6202b90ae13	ES256
webAuthnPolicyRpId	e714c293-8916-447d-acec-a6202b90ae13	
webAuthnPolicyAttestationConveyancePreference	e714c293-8916-447d-acec-a6202b90ae13	not specified
webAuthnPolicyAuthenticatorAttachment	e714c293-8916-447d-acec-a6202b90ae13	not specified
webAuthnPolicyRequireResidentKey	e714c293-8916-447d-acec-a6202b90ae13	not specified
webAuthnPolicyUserVerificationRequirement	e714c293-8916-447d-acec-a6202b90ae13	not specified
webAuthnPolicyCreateTimeout	e714c293-8916-447d-acec-a6202b90ae13	0
webAuthnPolicyAvoidSameAuthenticatorRegister	e714c293-8916-447d-acec-a6202b90ae13	false
webAuthnPolicyRpEntityNamePasswordless	e714c293-8916-447d-acec-a6202b90ae13	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	e714c293-8916-447d-acec-a6202b90ae13	ES256
webAuthnPolicyRpIdPasswordless	e714c293-8916-447d-acec-a6202b90ae13	
webAuthnPolicyAttestationConveyancePreferencePasswordless	e714c293-8916-447d-acec-a6202b90ae13	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	e714c293-8916-447d-acec-a6202b90ae13	not specified
webAuthnPolicyRequireResidentKeyPasswordless	e714c293-8916-447d-acec-a6202b90ae13	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	e714c293-8916-447d-acec-a6202b90ae13	not specified
webAuthnPolicyCreateTimeoutPasswordless	e714c293-8916-447d-acec-a6202b90ae13	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	e714c293-8916-447d-acec-a6202b90ae13	false
cibaBackchannelTokenDeliveryMode	e714c293-8916-447d-acec-a6202b90ae13	poll
cibaExpiresIn	e714c293-8916-447d-acec-a6202b90ae13	120
cibaInterval	e714c293-8916-447d-acec-a6202b90ae13	5
cibaAuthRequestedUserHint	e714c293-8916-447d-acec-a6202b90ae13	login_hint
parRequestUriLifespan	e714c293-8916-447d-acec-a6202b90ae13	60
\.


--
-- TOC entry 4209 (class 0 OID 17217)
-- Dependencies: 274
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- TOC entry 4186 (class 0 OID 16913)
-- Dependencies: 251
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- TOC entry 4162 (class 0 OID 16468)
-- Dependencies: 227
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.realm_events_listeners (realm_id, value) FROM stdin;
dbdc26c7-3f31-4332-bae9-a245a94f1c51	jboss-logging
e714c293-8916-447d-acec-a6202b90ae13	jboss-logging
\.


--
-- TOC entry 4242 (class 0 OID 17919)
-- Dependencies: 307
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- TOC entry 4163 (class 0 OID 16471)
-- Dependencies: 228
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	dbdc26c7-3f31-4332-bae9-a245a94f1c51
password	password	t	t	e714c293-8916-447d-acec-a6202b90ae13
\.


--
-- TOC entry 4164 (class 0 OID 16478)
-- Dependencies: 229
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- TOC entry 4184 (class 0 OID 16829)
-- Dependencies: 249
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- TOC entry 4165 (class 0 OID 16488)
-- Dependencies: 230
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.redirect_uris (client_id, value) FROM stdin;
14dbf716-a258-4e80-b0c9-2d80be221444	/realms/master/account/*
b57ee92e-acfc-4b20-8b27-ef9367de2339	/realms/master/account/*
d1230af8-b5d4-43e6-abaa-535e227f6242	/admin/master/console/*
d2a19db5-9d31-4108-9e49-63cd169356d7	/realms/secure-client-realm/account/*
fa9559f2-8a34-402c-a370-5baa577d06e5	/realms/secure-client-realm/account/*
f87a998e-f2d4-40f8-889a-e94ac271f609	/admin/secure-client-realm/console/*
ccb6b605-1a41-4064-b9ec-659b971d96d8	http://localhost:8080/*
35749ab8-4b2b-4d71-b8b3-2bf8b346f836	http://localhost:8080/*
\.


--
-- TOC entry 4202 (class 0 OID 17152)
-- Dependencies: 267
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- TOC entry 4201 (class 0 OID 17145)
-- Dependencies: 266
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
2d06441a-4e16-44cd-841a-e99c53767b26	VERIFY_EMAIL	Verify Email	dbdc26c7-3f31-4332-bae9-a245a94f1c51	t	f	VERIFY_EMAIL	50
207ac0b1-72d8-4899-bac9-8112d122b06b	UPDATE_PROFILE	Update Profile	dbdc26c7-3f31-4332-bae9-a245a94f1c51	t	f	UPDATE_PROFILE	40
89b8b4fe-1d51-4f0a-abec-7a47673d8dc1	CONFIGURE_TOTP	Configure OTP	dbdc26c7-3f31-4332-bae9-a245a94f1c51	t	f	CONFIGURE_TOTP	10
2c05b078-f375-4009-a32d-05e63799a755	UPDATE_PASSWORD	Update Password	dbdc26c7-3f31-4332-bae9-a245a94f1c51	t	f	UPDATE_PASSWORD	30
f5edf8a6-37d8-42c4-b998-870fdb007b2a	TERMS_AND_CONDITIONS	Terms and Conditions	dbdc26c7-3f31-4332-bae9-a245a94f1c51	f	f	TERMS_AND_CONDITIONS	20
dd707eb8-5972-4e47-8448-525d3fc55dba	delete_account	Delete Account	dbdc26c7-3f31-4332-bae9-a245a94f1c51	f	f	delete_account	60
85da2f06-e00f-4e90-8bf5-a12514c2efdb	update_user_locale	Update User Locale	dbdc26c7-3f31-4332-bae9-a245a94f1c51	t	f	update_user_locale	1000
07fd452b-00e8-4f21-a95c-0ec5e6e7a72e	webauthn-register	Webauthn Register	dbdc26c7-3f31-4332-bae9-a245a94f1c51	t	f	webauthn-register	70
45140f31-102b-40e2-b3b7-8376f9b5f70d	webauthn-register-passwordless	Webauthn Register Passwordless	dbdc26c7-3f31-4332-bae9-a245a94f1c51	t	f	webauthn-register-passwordless	80
d32f01ea-fba8-404b-9fbb-fcf39b31f06d	VERIFY_EMAIL	Verify Email	e714c293-8916-447d-acec-a6202b90ae13	t	f	VERIFY_EMAIL	50
e63cf712-50ee-44e1-92f1-f624b28003bf	UPDATE_PROFILE	Update Profile	e714c293-8916-447d-acec-a6202b90ae13	t	f	UPDATE_PROFILE	40
aeba7912-9470-4a80-a70d-61540841cd45	CONFIGURE_TOTP	Configure OTP	e714c293-8916-447d-acec-a6202b90ae13	t	f	CONFIGURE_TOTP	10
b11bf910-224b-4f0b-88f3-3b5617312cb4	UPDATE_PASSWORD	Update Password	e714c293-8916-447d-acec-a6202b90ae13	t	f	UPDATE_PASSWORD	30
36e0728b-c00a-4841-b506-b91b3579404c	TERMS_AND_CONDITIONS	Terms and Conditions	e714c293-8916-447d-acec-a6202b90ae13	f	f	TERMS_AND_CONDITIONS	20
df33ae22-4e65-41c5-834e-3cdf328002c4	delete_account	Delete Account	e714c293-8916-447d-acec-a6202b90ae13	f	f	delete_account	60
d107f48f-bf32-47b6-8d34-e867b6bd64a0	update_user_locale	Update User Locale	e714c293-8916-447d-acec-a6202b90ae13	t	f	update_user_locale	1000
ff07de1c-64c8-462d-99be-85eb350b9c43	webauthn-register	Webauthn Register	e714c293-8916-447d-acec-a6202b90ae13	t	f	webauthn-register	70
74fa8d68-604f-47bb-ac2a-e00f2fb38f82	webauthn-register-passwordless	Webauthn Register Passwordless	e714c293-8916-447d-acec-a6202b90ae13	t	f	webauthn-register-passwordless	80
\.


--
-- TOC entry 4239 (class 0 OID 17850)
-- Dependencies: 304
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- TOC entry 4219 (class 0 OID 17434)
-- Dependencies: 284
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- TOC entry 4218 (class 0 OID 17419)
-- Dependencies: 283
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- TOC entry 4213 (class 0 OID 17357)
-- Dependencies: 278
-- Data for Name: resource_server; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- TOC entry 4238 (class 0 OID 17826)
-- Dependencies: 303
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- TOC entry 4216 (class 0 OID 17393)
-- Dependencies: 281
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- TOC entry 4214 (class 0 OID 17365)
-- Dependencies: 279
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- TOC entry 4215 (class 0 OID 17379)
-- Dependencies: 280
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- TOC entry 4240 (class 0 OID 17868)
-- Dependencies: 305
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.resource_uris (resource_id, value) FROM stdin;
\.


--
-- TOC entry 4241 (class 0 OID 17878)
-- Dependencies: 306
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- TOC entry 4166 (class 0 OID 16491)
-- Dependencies: 231
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.scope_mapping (client_id, role_id) FROM stdin;
b57ee92e-acfc-4b20-8b27-ef9367de2339	fd730af9-7011-41e6-a59f-43e8b39db0a7
b57ee92e-acfc-4b20-8b27-ef9367de2339	72ada4b6-02d1-435b-bdcc-3f5f19da410f
fa9559f2-8a34-402c-a370-5baa577d06e5	c4a7bde4-2e04-4923-a83b-18a08424747d
fa9559f2-8a34-402c-a370-5baa577d06e5	11489bfc-ac3b-40ee-a5c9-c41b693a2c04
\.


--
-- TOC entry 4220 (class 0 OID 17449)
-- Dependencies: 285
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- TOC entry 4168 (class 0 OID 16497)
-- Dependencies: 233
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- TOC entry 4190 (class 0 OID 16934)
-- Dependencies: 255
-- Data for Name: user_consent; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- TOC entry 4236 (class 0 OID 17801)
-- Dependencies: 301
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- TOC entry 4169 (class 0 OID 16502)
-- Dependencies: 234
-- Data for Name: user_entity; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
24e4c721-a324-458d-bd5e-c33efb6f7e02	\N	bf74af4e-aa60-4e12-be2b-a4db9c6e259a	f	t	\N	\N	\N	dbdc26c7-3f31-4332-bae9-a245a94f1c51	admin	1724595896370	\N	0
d2aede76-d256-4ef0-ab94-807a40ad65d4	\N	3e07fd60-5710-4f1e-8dcb-a5e7ea260405	f	t	\N	\N	\N	e714c293-8916-447d-acec-a6202b90ae13	service-account-admin-cli	1724597894528	ccb6b605-1a41-4064-b9ec-659b971d96d8	0
3d30ddc4-c7d7-45af-886f-131c330119ee	admin@admin.com	admin@admin.com	t	t	\N			e714c293-8916-447d-acec-a6202b90ae13	admin	1724604054613	\N	0
43668f21-1ede-4e46-a026-88bd1675a317	user3@user2.user2	user3@user2.user2	t	t	\N	user2	user2	e714c293-8916-447d-acec-a6202b90ae13	user3	1724606405968	\N	0
904ce2b0-ac88-4db7-950f-b4e9825c5261	user4@user2.user2	user4@user2.user2	t	t	\N	\N	\N	e714c293-8916-447d-acec-a6202b90ae13	user4	1724606517109	\N	0
\.


--
-- TOC entry 4170 (class 0 OID 16510)
-- Dependencies: 235
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- TOC entry 4197 (class 0 OID 17046)
-- Dependencies: 262
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- TOC entry 4198 (class 0 OID 17051)
-- Dependencies: 263
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- TOC entry 4171 (class 0 OID 16515)
-- Dependencies: 236
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- TOC entry 4208 (class 0 OID 17214)
-- Dependencies: 273
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- TOC entry 4172 (class 0 OID 16520)
-- Dependencies: 237
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- TOC entry 4173 (class 0 OID 16523)
-- Dependencies: 238
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.user_role_mapping (role_id, user_id) FROM stdin;
91b63f58-c8c6-4f40-97e7-718f9692e901	24e4c721-a324-458d-bd5e-c33efb6f7e02
e3f0d47e-a0df-426e-aaf7-713831196bb5	24e4c721-a324-458d-bd5e-c33efb6f7e02
18838fae-d334-4235-b9cd-fa4c188ec1c8	24e4c721-a324-458d-bd5e-c33efb6f7e02
b99cce9d-ca3b-4357-8e6a-d97f584ea873	24e4c721-a324-458d-bd5e-c33efb6f7e02
a81a7d02-db4e-470c-bd60-8036ed528846	24e4c721-a324-458d-bd5e-c33efb6f7e02
d539c9d4-84ac-4c53-a7ee-deae15a969cd	24e4c721-a324-458d-bd5e-c33efb6f7e02
e6064096-506e-4c2c-aca7-0e2e4715766d	24e4c721-a324-458d-bd5e-c33efb6f7e02
cdfefad0-9b50-4a7e-80b7-348263fc7e4d	24e4c721-a324-458d-bd5e-c33efb6f7e02
176bd3ec-50fb-4b3d-ae6a-7a0bcdacab98	24e4c721-a324-458d-bd5e-c33efb6f7e02
0d355637-4957-45f0-8dee-fd97bd43c383	24e4c721-a324-458d-bd5e-c33efb6f7e02
7aaaf853-8da5-4620-80e4-44786aefb7c6	24e4c721-a324-458d-bd5e-c33efb6f7e02
6f203878-864b-43ef-89a7-21d6b2b7a5ac	24e4c721-a324-458d-bd5e-c33efb6f7e02
faa39396-7e3b-464d-a618-eab6b67eda86	24e4c721-a324-458d-bd5e-c33efb6f7e02
30faaa38-c37b-4a45-b354-009923fdf34c	24e4c721-a324-458d-bd5e-c33efb6f7e02
6c0fa72c-105f-42dd-a02a-7c4932f1587d	24e4c721-a324-458d-bd5e-c33efb6f7e02
841d466a-6a27-45fd-a59c-7f1fc1626ae6	24e4c721-a324-458d-bd5e-c33efb6f7e02
3dad17aa-b43d-4bba-bf83-e52772e04f2d	24e4c721-a324-458d-bd5e-c33efb6f7e02
5f7ceb33-c1b8-4cb4-b98c-57332b9bdef0	24e4c721-a324-458d-bd5e-c33efb6f7e02
dccacab0-ea9b-4835-9aa1-9c7fcda8d763	24e4c721-a324-458d-bd5e-c33efb6f7e02
c346a324-63f8-4d17-8afd-57237cbbb385	d2aede76-d256-4ef0-ab94-807a40ad65d4
327532a4-d84d-4fe8-9f24-1239be56c6bf	d2aede76-d256-4ef0-ab94-807a40ad65d4
02203b11-cac2-4523-9b05-52abc80f353b	d2aede76-d256-4ef0-ab94-807a40ad65d4
c346a324-63f8-4d17-8afd-57237cbbb385	3d30ddc4-c7d7-45af-886f-131c330119ee
c346a324-63f8-4d17-8afd-57237cbbb385	43668f21-1ede-4e46-a026-88bd1675a317
c346a324-63f8-4d17-8afd-57237cbbb385	904ce2b0-ac88-4db7-950f-b4e9825c5261
591e5843-83f3-4f80-a829-357806949255	d2aede76-d256-4ef0-ab94-807a40ad65d4
a8cab8de-e3f6-4cb8-8eda-d1ef13aacb1d	d2aede76-d256-4ef0-ab94-807a40ad65d4
47021daa-d96e-4104-a536-521a84b2ab28	d2aede76-d256-4ef0-ab94-807a40ad65d4
ac1e0677-80f4-4807-bf5e-b7270c3c5acc	d2aede76-d256-4ef0-ab94-807a40ad65d4
135c59a7-13da-48df-973b-2319f19be1cf	43668f21-1ede-4e46-a026-88bd1675a317
135c59a7-13da-48df-973b-2319f19be1cf	904ce2b0-ac88-4db7-950f-b4e9825c5261
5d669a59-6ef7-47f8-8c3e-ff216b89a0e1	904ce2b0-ac88-4db7-950f-b4e9825c5261
5d669a59-6ef7-47f8-8c3e-ff216b89a0e1	3d30ddc4-c7d7-45af-886f-131c330119ee
135c59a7-13da-48df-973b-2319f19be1cf	3d30ddc4-c7d7-45af-886f-131c330119ee
\.


--
-- TOC entry 4174 (class 0 OID 16526)
-- Dependencies: 239
-- Data for Name: user_session; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- TOC entry 4185 (class 0 OID 16832)
-- Dependencies: 250
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- TOC entry 4167 (class 0 OID 16494)
-- Dependencies: 232
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- TOC entry 4175 (class 0 OID 16537)
-- Dependencies: 240
-- Data for Name: web_origins; Type: TABLE DATA; Schema: keycloak; Owner: admin
--

COPY keycloak.web_origins (client_id, value) FROM stdin;
d1230af8-b5d4-43e6-abaa-535e227f6242	+
f87a998e-f2d4-40f8-889a-e94ac271f609	+
35749ab8-4b2b-4d71-b8b3-2bf8b346f836	http://localhost:8080
\.


--
-- TOC entry 3691 (class 2606 OID 17593)
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- TOC entry 3664 (class 2606 OID 17902)
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- TOC entry 3907 (class 2606 OID 17732)
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- TOC entry 3909 (class 2606 OID 17931)
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- TOC entry 3904 (class 2606 OID 17607)
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- TOC entry 3821 (class 2606 OID 17255)
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- TOC entry 3869 (class 2606 OID 17530)
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- TOC entry 3790 (class 2606 OID 17164)
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- TOC entry 3895 (class 2606 OID 17550)
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- TOC entry 3898 (class 2606 OID 17548)
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- TOC entry 3887 (class 2606 OID 17546)
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- TOC entry 3871 (class 2606 OID 17532)
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- TOC entry 3874 (class 2606 OID 17534)
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- TOC entry 3879 (class 2606 OID 17540)
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- TOC entry 3883 (class 2606 OID 17542)
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- TOC entry 3891 (class 2606 OID 17544)
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- TOC entry 3902 (class 2606 OID 17587)
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- TOC entry 3823 (class 2606 OID 17691)
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- TOC entry 3749 (class 2606 OID 17708)
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- TOC entry 3678 (class 2606 OID 17710)
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- TOC entry 3744 (class 2606 OID 17712)
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- TOC entry 3737 (class 2606 OID 16841)
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- TOC entry 3721 (class 2606 OID 16775)
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- TOC entry 3661 (class 2606 OID 16549)
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- TOC entry 3733 (class 2606 OID 16843)
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- TOC entry 3670 (class 2606 OID 16551)
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- TOC entry 3652 (class 2606 OID 16553)
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- TOC entry 3716 (class 2606 OID 16555)
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- TOC entry 3707 (class 2606 OID 16557)
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- TOC entry 3723 (class 2606 OID 16777)
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- TOC entry 3644 (class 2606 OID 16561)
-- Name: client constraint_7; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- TOC entry 3649 (class 2606 OID 16563)
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- TOC entry 3688 (class 2606 OID 16565)
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- TOC entry 3725 (class 2606 OID 16779)
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- TOC entry 3675 (class 2606 OID 16567)
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- TOC entry 3681 (class 2606 OID 16569)
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- TOC entry 3666 (class 2606 OID 16571)
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- TOC entry 3767 (class 2606 OID 17695)
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- TOC entry 3780 (class 2606 OID 17072)
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- TOC entry 3776 (class 2606 OID 17070)
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- TOC entry 3773 (class 2606 OID 17068)
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- TOC entry 3770 (class 2606 OID 17066)
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- TOC entry 3788 (class 2606 OID 17076)
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- TOC entry 3713 (class 2606 OID 16573)
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- TOC entry 3654 (class 2606 OID 17689)
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- TOC entry 3765 (class 2606 OID 16959)
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- TOC entry 3742 (class 2606 OID 16845)
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- TOC entry 3855 (class 2606 OID 17413)
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- TOC entry 3683 (class 2606 OID 16575)
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- TOC entry 3658 (class 2606 OID 16577)
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- TOC entry 3705 (class 2606 OID 16579)
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- TOC entry 3922 (class 2606 OID 17830)
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- TOC entry 3840 (class 2606 OID 17371)
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- TOC entry 3850 (class 2606 OID 17399)
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- TOC entry 3866 (class 2606 OID 17468)
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- TOC entry 3860 (class 2606 OID 17438)
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- TOC entry 3845 (class 2606 OID 17385)
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- TOC entry 3857 (class 2606 OID 17423)
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- TOC entry 3863 (class 2606 OID 17453)
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- TOC entry 3697 (class 2606 OID 16581)
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- TOC entry 3786 (class 2606 OID 17080)
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- TOC entry 3782 (class 2606 OID 17078)
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- TOC entry 3920 (class 2606 OID 17815)
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- TOC entry 3917 (class 2606 OID 17805)
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- TOC entry 3760 (class 2606 OID 16953)
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- TOC entry 3807 (class 2606 OID 17222)
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- TOC entry 3814 (class 2606 OID 17229)
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3811 (class 2606 OID 17243)
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- TOC entry 3755 (class 2606 OID 16949)
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- TOC entry 3758 (class 2606 OID 17129)
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- TOC entry 3752 (class 2606 OID 16947)
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- TOC entry 3803 (class 2606 OID 17908)
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- TOC entry 3797 (class 2606 OID 17199)
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- TOC entry 3727 (class 2606 OID 16839)
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- TOC entry 3731 (class 2606 OID 17122)
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- TOC entry 3685 (class 2606 OID 17714)
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- TOC entry 3795 (class 2606 OID 17162)
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- TOC entry 3792 (class 2606 OID 17160)
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- TOC entry 3710 (class 2606 OID 17074)
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- TOC entry 3928 (class 2606 OID 17877)
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- TOC entry 3930 (class 2606 OID 17884)
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3693 (class 2606 OID 17158)
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3818 (class 2606 OID 17236)
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- TOC entry 3747 (class 2606 OID 16849)
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- TOC entry 3718 (class 2606 OID 17716)
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- TOC entry 3642 (class 2606 OID 16393)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 3832 (class 2606 OID 17339)
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- TOC entry 3827 (class 2606 OID 17298)
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- TOC entry 3838 (class 2606 OID 17669)
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- TOC entry 3836 (class 2606 OID 17327)
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- TOC entry 3915 (class 2606 OID 17790)
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- TOC entry 3933 (class 2606 OID 17925)
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- TOC entry 3926 (class 2606 OID 17857)
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- TOC entry 3809 (class 2606 OID 17599)
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- TOC entry 3740 (class 2606 OID 16896)
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- TOC entry 3647 (class 2606 OID 16585)
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- TOC entry 3829 (class 2606 OID 17743)
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- TOC entry 3701 (class 2606 OID 16589)
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- TOC entry 3843 (class 2606 OID 17916)
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- TOC entry 3924 (class 2606 OID 17912)
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- TOC entry 3853 (class 2606 OID 17660)
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- TOC entry 3848 (class 2606 OID 17664)
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- TOC entry 3763 (class 2606 OID 17904)
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- TOC entry 3673 (class 2606 OID 16597)
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- TOC entry 3703 (class 2606 OID 17589)
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- TOC entry 3768 (class 1259 OID 17941)
-- Name: idx_admin_event_time; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_admin_event_time ON keycloak.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- TOC entry 3867 (class 1259 OID 17613)
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON keycloak.associated_policy USING btree (associated_policy_id);


--
-- TOC entry 3771 (class 1259 OID 17617)
-- Name: idx_auth_config_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_auth_config_realm ON keycloak.authenticator_config USING btree (realm_id);


--
-- TOC entry 3777 (class 1259 OID 17615)
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_auth_exec_flow ON keycloak.authentication_execution USING btree (flow_id);


--
-- TOC entry 3778 (class 1259 OID 17614)
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_auth_exec_realm_flow ON keycloak.authentication_execution USING btree (realm_id, flow_id);


--
-- TOC entry 3774 (class 1259 OID 17616)
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_auth_flow_realm ON keycloak.authentication_flow USING btree (realm_id);


--
-- TOC entry 3910 (class 1259 OID 17932)
-- Name: idx_cl_clscope; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_cl_clscope ON keycloak.client_scope_client USING btree (scope_id);


--
-- TOC entry 3645 (class 1259 OID 17917)
-- Name: idx_client_id; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_client_id ON keycloak.client USING btree (client_id);


--
-- TOC entry 3905 (class 1259 OID 17657)
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_client_init_acc_realm ON keycloak.client_initial_access USING btree (realm_id);


--
-- TOC entry 3650 (class 1259 OID 17621)
-- Name: idx_client_session_session; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_client_session_session ON keycloak.client_session USING btree (session_id);


--
-- TOC entry 3830 (class 1259 OID 17820)
-- Name: idx_clscope_attrs; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_clscope_attrs ON keycloak.client_scope_attributes USING btree (scope_id);


--
-- TOC entry 3911 (class 1259 OID 17929)
-- Name: idx_clscope_cl; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_clscope_cl ON keycloak.client_scope_client USING btree (client_id);


--
-- TOC entry 3728 (class 1259 OID 17817)
-- Name: idx_clscope_protmap; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_clscope_protmap ON keycloak.protocol_mapper USING btree (client_scope_id);


--
-- TOC entry 3833 (class 1259 OID 17818)
-- Name: idx_clscope_role; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_clscope_role ON keycloak.client_scope_role_mapping USING btree (scope_id);


--
-- TOC entry 3896 (class 1259 OID 17623)
-- Name: idx_compo_config_compo; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_compo_config_compo ON keycloak.component_config USING btree (component_id);


--
-- TOC entry 3899 (class 1259 OID 17891)
-- Name: idx_component_provider_type; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_component_provider_type ON keycloak.component USING btree (provider_type);


--
-- TOC entry 3900 (class 1259 OID 17622)
-- Name: idx_component_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_component_realm ON keycloak.component USING btree (realm_id);


--
-- TOC entry 3655 (class 1259 OID 17624)
-- Name: idx_composite; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_composite ON keycloak.composite_role USING btree (composite);


--
-- TOC entry 3656 (class 1259 OID 17625)
-- Name: idx_composite_child; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_composite_child ON keycloak.composite_role USING btree (child_role);


--
-- TOC entry 3912 (class 1259 OID 17823)
-- Name: idx_defcls_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_defcls_realm ON keycloak.default_client_scope USING btree (realm_id);


--
-- TOC entry 3913 (class 1259 OID 17824)
-- Name: idx_defcls_scope; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_defcls_scope ON keycloak.default_client_scope USING btree (scope_id);


--
-- TOC entry 3662 (class 1259 OID 17918)
-- Name: idx_event_time; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_event_time ON keycloak.event_entity USING btree (realm_id, event_time);


--
-- TOC entry 3734 (class 1259 OID 17356)
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fedidentity_feduser ON keycloak.federated_identity USING btree (federated_user_id);


--
-- TOC entry 3735 (class 1259 OID 17355)
-- Name: idx_fedidentity_user; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fedidentity_user ON keycloak.federated_identity USING btree (user_id);


--
-- TOC entry 3872 (class 1259 OID 17717)
-- Name: idx_fu_attribute; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_attribute ON keycloak.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- TOC entry 3875 (class 1259 OID 17737)
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_cnsnt_ext ON keycloak.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- TOC entry 3876 (class 1259 OID 17900)
-- Name: idx_fu_consent; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_consent ON keycloak.fed_user_consent USING btree (user_id, client_id);


--
-- TOC entry 3877 (class 1259 OID 17719)
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_consent_ru ON keycloak.fed_user_consent USING btree (realm_id, user_id);


--
-- TOC entry 3880 (class 1259 OID 17720)
-- Name: idx_fu_credential; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_credential ON keycloak.fed_user_credential USING btree (user_id, type);


--
-- TOC entry 3881 (class 1259 OID 17721)
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_credential_ru ON keycloak.fed_user_credential USING btree (realm_id, user_id);


--
-- TOC entry 3884 (class 1259 OID 17722)
-- Name: idx_fu_group_membership; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_group_membership ON keycloak.fed_user_group_membership USING btree (user_id, group_id);


--
-- TOC entry 3885 (class 1259 OID 17723)
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_group_membership_ru ON keycloak.fed_user_group_membership USING btree (realm_id, user_id);


--
-- TOC entry 3888 (class 1259 OID 17724)
-- Name: idx_fu_required_action; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_required_action ON keycloak.fed_user_required_action USING btree (user_id, required_action);


--
-- TOC entry 3889 (class 1259 OID 17725)
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_required_action_ru ON keycloak.fed_user_required_action USING btree (realm_id, user_id);


--
-- TOC entry 3892 (class 1259 OID 17726)
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_role_mapping ON keycloak.fed_user_role_mapping USING btree (user_id, role_id);


--
-- TOC entry 3893 (class 1259 OID 17727)
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_fu_role_mapping_ru ON keycloak.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- TOC entry 3815 (class 1259 OID 17942)
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_group_att_by_name_value ON keycloak.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- TOC entry 3816 (class 1259 OID 17628)
-- Name: idx_group_attr_group; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_group_attr_group ON keycloak.group_attribute USING btree (group_id);


--
-- TOC entry 3812 (class 1259 OID 17629)
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_group_role_mapp_group ON keycloak.group_role_mapping USING btree (group_id);


--
-- TOC entry 3756 (class 1259 OID 17631)
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_id_prov_mapp_realm ON keycloak.identity_provider_mapper USING btree (realm_id);


--
-- TOC entry 3738 (class 1259 OID 17630)
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_ident_prov_realm ON keycloak.identity_provider USING btree (realm_id);


--
-- TOC entry 3667 (class 1259 OID 17632)
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_keycloak_role_client ON keycloak.keycloak_role USING btree (client);


--
-- TOC entry 3668 (class 1259 OID 17633)
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_keycloak_role_realm ON keycloak.keycloak_role USING btree (realm);


--
-- TOC entry 3804 (class 1259 OID 17935)
-- Name: idx_offline_css_preload; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_offline_css_preload ON keycloak.offline_client_session USING btree (client_id, offline_flag);


--
-- TOC entry 3798 (class 1259 OID 17936)
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_offline_uss_by_user ON keycloak.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- TOC entry 3799 (class 1259 OID 17937)
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_offline_uss_by_usersess ON keycloak.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- TOC entry 3800 (class 1259 OID 17895)
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_offline_uss_createdon ON keycloak.offline_user_session USING btree (created_on);


--
-- TOC entry 3801 (class 1259 OID 17926)
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_offline_uss_preload ON keycloak.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- TOC entry 3729 (class 1259 OID 17634)
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_protocol_mapper_client ON keycloak.protocol_mapper USING btree (client_id);


--
-- TOC entry 3676 (class 1259 OID 17637)
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_realm_attr_realm ON keycloak.realm_attribute USING btree (realm_id);


--
-- TOC entry 3825 (class 1259 OID 17816)
-- Name: idx_realm_clscope; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_realm_clscope ON keycloak.client_scope USING btree (realm_id);


--
-- TOC entry 3824 (class 1259 OID 17638)
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_realm_def_grp_realm ON keycloak.realm_default_groups USING btree (realm_id);


--
-- TOC entry 3679 (class 1259 OID 17641)
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_realm_evt_list_realm ON keycloak.realm_events_listeners USING btree (realm_id);


--
-- TOC entry 3750 (class 1259 OID 17640)
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_realm_evt_types_realm ON keycloak.realm_enabled_event_types USING btree (realm_id);


--
-- TOC entry 3671 (class 1259 OID 17636)
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_realm_master_adm_cli ON keycloak.realm USING btree (master_admin_client);


--
-- TOC entry 3745 (class 1259 OID 17642)
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_realm_supp_local_realm ON keycloak.realm_supported_locales USING btree (realm_id);


--
-- TOC entry 3686 (class 1259 OID 17643)
-- Name: idx_redir_uri_client; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_redir_uri_client ON keycloak.redirect_uris USING btree (client_id);


--
-- TOC entry 3793 (class 1259 OID 17644)
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_req_act_prov_realm ON keycloak.required_action_provider USING btree (realm_id);


--
-- TOC entry 3861 (class 1259 OID 17645)
-- Name: idx_res_policy_policy; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_res_policy_policy ON keycloak.resource_policy USING btree (policy_id);


--
-- TOC entry 3858 (class 1259 OID 17646)
-- Name: idx_res_scope_scope; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_res_scope_scope ON keycloak.resource_scope USING btree (scope_id);


--
-- TOC entry 3851 (class 1259 OID 17665)
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_res_serv_pol_res_serv ON keycloak.resource_server_policy USING btree (resource_server_id);


--
-- TOC entry 3841 (class 1259 OID 17666)
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_res_srv_res_res_srv ON keycloak.resource_server_resource USING btree (resource_server_id);


--
-- TOC entry 3846 (class 1259 OID 17667)
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_res_srv_scope_res_srv ON keycloak.resource_server_scope USING btree (resource_server_id);


--
-- TOC entry 3931 (class 1259 OID 17890)
-- Name: idx_role_attribute; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_role_attribute ON keycloak.role_attribute USING btree (role_id);


--
-- TOC entry 3834 (class 1259 OID 17819)
-- Name: idx_role_clscope; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_role_clscope ON keycloak.client_scope_role_mapping USING btree (role_id);


--
-- TOC entry 3689 (class 1259 OID 17650)
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_scope_mapping_role ON keycloak.scope_mapping USING btree (role_id);


--
-- TOC entry 3864 (class 1259 OID 17651)
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_scope_policy_policy ON keycloak.scope_policy USING btree (policy_id);


--
-- TOC entry 3753 (class 1259 OID 17898)
-- Name: idx_update_time; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_update_time ON keycloak.migration_model USING btree (update_time);


--
-- TOC entry 3805 (class 1259 OID 17345)
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON keycloak.offline_client_session USING btree (user_session_id);


--
-- TOC entry 3918 (class 1259 OID 17825)
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_usconsent_clscope ON keycloak.user_consent_client_scope USING btree (user_consent_id);


--
-- TOC entry 3694 (class 1259 OID 17352)
-- Name: idx_user_attribute; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_user_attribute ON keycloak.user_attribute USING btree (user_id);


--
-- TOC entry 3695 (class 1259 OID 17939)
-- Name: idx_user_attribute_name; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_user_attribute_name ON keycloak.user_attribute USING btree (name, value);


--
-- TOC entry 3761 (class 1259 OID 17349)
-- Name: idx_user_consent; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_user_consent ON keycloak.user_consent USING btree (user_id);


--
-- TOC entry 3659 (class 1259 OID 17353)
-- Name: idx_user_credential; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_user_credential ON keycloak.credential USING btree (user_id);


--
-- TOC entry 3698 (class 1259 OID 17346)
-- Name: idx_user_email; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_user_email ON keycloak.user_entity USING btree (email);


--
-- TOC entry 3819 (class 1259 OID 17348)
-- Name: idx_user_group_mapping; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_user_group_mapping ON keycloak.user_group_membership USING btree (user_id);


--
-- TOC entry 3711 (class 1259 OID 17354)
-- Name: idx_user_reqactions; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_user_reqactions ON keycloak.user_required_action USING btree (user_id);


--
-- TOC entry 3714 (class 1259 OID 17347)
-- Name: idx_user_role_mapping; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_user_role_mapping ON keycloak.user_role_mapping USING btree (user_id);


--
-- TOC entry 3699 (class 1259 OID 17940)
-- Name: idx_user_service_account; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_user_service_account ON keycloak.user_entity USING btree (realm_id, service_account_client_link);


--
-- TOC entry 3783 (class 1259 OID 17653)
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_usr_fed_map_fed_prv ON keycloak.user_federation_mapper USING btree (federation_provider_id);


--
-- TOC entry 3784 (class 1259 OID 17654)
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_usr_fed_map_realm ON keycloak.user_federation_mapper USING btree (realm_id);


--
-- TOC entry 3708 (class 1259 OID 17655)
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_usr_fed_prv_realm ON keycloak.user_federation_provider USING btree (realm_id);


--
-- TOC entry 3719 (class 1259 OID 17656)
-- Name: idx_web_orig_client; Type: INDEX; Schema: keycloak; Owner: admin
--

CREATE INDEX idx_web_orig_client ON keycloak.web_origins USING btree (client_id);


--
-- TOC entry 3975 (class 2606 OID 17081)
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES keycloak.client_session(id);


--
-- TOC entry 3959 (class 2606 OID 16850)
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- TOC entry 3952 (class 2606 OID 16780)
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES keycloak.client(id);


--
-- TOC entry 3958 (class 2606 OID 16860)
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES keycloak.user_entity(id);


--
-- TOC entry 3954 (class 2606 OID 17007)
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES keycloak.client(id);


--
-- TOC entry 3953 (class 2606 OID 16785)
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES keycloak.client_session(id);


--
-- TOC entry 3962 (class 2606 OID 16890)
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES keycloak.user_session(id);


--
-- TOC entry 3935 (class 2606 OID 16600)
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES keycloak.client_session(id);


--
-- TOC entry 3944 (class 2606 OID 16605)
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES keycloak.client(id);


--
-- TOC entry 3948 (class 2606 OID 16610)
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- TOC entry 3967 (class 2606 OID 16985)
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES keycloak.client_session(id);


--
-- TOC entry 3942 (class 2606 OID 16620)
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- TOC entry 4005 (class 2606 OID 17858)
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES keycloak.resource_server_resource(id);


--
-- TOC entry 3946 (class 2606 OID 16625)
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES keycloak.user_entity(id);


--
-- TOC entry 3949 (class 2606 OID 16635)
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES keycloak.user_entity(id);


--
-- TOC entry 3939 (class 2606 OID 16640)
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES keycloak.realm(id);


--
-- TOC entry 3943 (class 2606 OID 16645)
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- TOC entry 3940 (class 2606 OID 16660)
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- TOC entry 3936 (class 2606 OID 16665)
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES keycloak.keycloak_role(id);


--
-- TOC entry 3970 (class 2606 OID 17101)
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES keycloak.authentication_flow(id);


--
-- TOC entry 3971 (class 2606 OID 17096)
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- TOC entry 3969 (class 2606 OID 17091)
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- TOC entry 3968 (class 2606 OID 17086)
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- TOC entry 3934 (class 2606 OID 16670)
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES keycloak.user_session(id);


--
-- TOC entry 3950 (class 2606 OID 16675)
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES keycloak.user_entity(id);


--
-- TOC entry 3982 (class 2606 OID 17764)
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES keycloak.client_scope(id);


--
-- TOC entry 3983 (class 2606 OID 17754)
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES keycloak.client_scope(id);


--
-- TOC entry 3976 (class 2606 OID 17170)
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES keycloak.client_session(id);


--
-- TOC entry 3955 (class 2606 OID 17749)
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES keycloak.client_scope(id);


--
-- TOC entry 3998 (class 2606 OID 17608)
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- TOC entry 3996 (class 2606 OID 17556)
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES keycloak.component(id);


--
-- TOC entry 3997 (class 2606 OID 17551)
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- TOC entry 3981 (class 2606 OID 17256)
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- TOC entry 3974 (class 2606 OID 17116)
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES keycloak.user_federation_mapper(id);


--
-- TOC entry 3972 (class 2606 OID 17111)
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES keycloak.user_federation_provider(id);


--
-- TOC entry 3973 (class 2606 OID 17106)
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- TOC entry 3994 (class 2606 OID 17474)
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES keycloak.resource_server_policy(id);


--
-- TOC entry 3992 (class 2606 OID 17459)
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES keycloak.resource_server_policy(id);


--
-- TOC entry 4001 (class 2606 OID 17831)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES keycloak.resource_server(id);


--
-- TOC entry 3984 (class 2606 OID 17675)
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES keycloak.resource_server(id);


--
-- TOC entry 4002 (class 2606 OID 17836)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES keycloak.resource_server_resource(id);


--
-- TOC entry 4003 (class 2606 OID 17841)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES keycloak.resource_server_scope(id);


--
-- TOC entry 3995 (class 2606 OID 17469)
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES keycloak.resource_server_policy(id);


--
-- TOC entry 3993 (class 2606 OID 17454)
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES keycloak.resource_server_scope(id);


--
-- TOC entry 4004 (class 2606 OID 17863)
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES keycloak.resource_server_policy(id);


--
-- TOC entry 3986 (class 2606 OID 17670)
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES keycloak.resource_server(id);


--
-- TOC entry 3988 (class 2606 OID 17424)
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES keycloak.resource_server_resource(id);


--
-- TOC entry 3990 (class 2606 OID 17439)
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES keycloak.resource_server_resource(id);


--
-- TOC entry 3991 (class 2606 OID 17444)
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES keycloak.resource_server_policy(id);


--
-- TOC entry 3989 (class 2606 OID 17429)
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES keycloak.resource_server_scope(id);


--
-- TOC entry 3985 (class 2606 OID 17680)
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES keycloak.resource_server(id);


--
-- TOC entry 3937 (class 2606 OID 16690)
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES keycloak.keycloak_role(id);


--
-- TOC entry 4000 (class 2606 OID 17806)
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES keycloak.user_consent(id);


--
-- TOC entry 3966 (class 2606 OID 16970)
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES keycloak.user_entity(id);


--
-- TOC entry 3979 (class 2606 OID 17230)
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES keycloak.keycloak_group(id);


--
-- TOC entry 3978 (class 2606 OID 17244)
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES keycloak.keycloak_group(id);


--
-- TOC entry 3963 (class 2606 OID 16916)
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- TOC entry 3941 (class 2606 OID 16700)
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- TOC entry 3964 (class 2606 OID 16960)
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- TOC entry 3965 (class 2606 OID 17130)
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES keycloak.identity_provider_mapper(id);


--
-- TOC entry 3951 (class 2606 OID 16710)
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES keycloak.client(id);


--
-- TOC entry 3945 (class 2606 OID 16720)
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES keycloak.client(id);


--
-- TOC entry 3956 (class 2606 OID 16855)
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES keycloak.client(id);


--
-- TOC entry 3938 (class 2606 OID 16735)
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES keycloak.user_entity(id);


--
-- TOC entry 3957 (class 2606 OID 17123)
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES keycloak.protocol_mapper(id);


--
-- TOC entry 3999 (class 2606 OID 17791)
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- TOC entry 3977 (class 2606 OID 17165)
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- TOC entry 4006 (class 2606 OID 17871)
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES keycloak.resource_server_resource(id);


--
-- TOC entry 4007 (class 2606 OID 17885)
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES keycloak.keycloak_role(id);


--
-- TOC entry 3961 (class 2606 OID 16885)
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES keycloak.realm(id);


--
-- TOC entry 3947 (class 2606 OID 16755)
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES keycloak.user_federation_provider(id);


--
-- TOC entry 3980 (class 2606 OID 17237)
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES keycloak.user_entity(id);


--
-- TOC entry 3987 (class 2606 OID 17414)
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES keycloak.resource_server_policy(id);


--
-- TOC entry 3960 (class 2606 OID 16865)
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: keycloak; Owner: admin
--

ALTER TABLE ONLY keycloak.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES keycloak.identity_provider(internal_id);


-- Completed on 2024-08-29 17:12:12 UTC

--
-- PostgreSQL database dump complete
--

