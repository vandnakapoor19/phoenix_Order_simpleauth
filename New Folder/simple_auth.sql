PGDMP                     	    w           simple_auth    11.5    11.5 7    I           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            J           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            K           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            L           1262    16744    simple_auth    DATABASE     �   CREATE DATABASE simple_auth WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE simple_auth;
             postgres    false            �            1259    16763    order_status    TABLE     �   CREATE TABLE public.order_status (
    id bigint NOT NULL,
    title character varying(255),
    status boolean DEFAULT true NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
     DROP TABLE public.order_status;
       public         postgres    false            �            1259    16761    order_status_id_seq    SEQUENCE     |   CREATE SEQUENCE public.order_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.order_status_id_seq;
       public       postgres    false    198            M           0    0    order_status_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.order_status_id_seq OWNED BY public.order_status.id;
            public       postgres    false    197            �            1259    16843    orders    TABLE     �  CREATE TABLE public.orders (
    id bigint NOT NULL,
    patient_name character varying(255),
    patient_email character varying(255),
    patient_address character varying(255),
    patient_state character varying(255),
    patient_city character varying(255),
    patient_zipcode integer,
    pickup_date date,
    pickup_time time(6) without time zone,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    order_number character varying(255),
    courier_id integer,
    order_status integer,
    user_id bigint,
    order_details character varying(255),
    order_cancel_description character varying(255),
    patient_contact character varying(255)
);
    DROP TABLE public.orders;
       public         postgres    false            �            1259    16841    orders_id_seq    SEQUENCE     v   CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public       postgres    false    206            N           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
            public       postgres    false    205            �            1259    16745    schema_migrations    TABLE     t   CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp without time zone
);
 %   DROP TABLE public.schema_migrations;
       public         postgres    false            �            1259    16798    user_order_status    TABLE     �  CREATE TABLE public.user_order_status (
    id bigint NOT NULL,
    user_id bigint,
    order_status_id bigint,
    name character varying(255),
    contact integer,
    email character varying(255),
    address character varying(255),
    state character varying(255),
    city character varying(255),
    zipcode integer,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 %   DROP TABLE public.user_order_status;
       public         postgres    false            �            1259    16796    user_order_status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_order_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.user_order_status_id_seq;
       public       postgres    false    204            O           0    0    user_order_status_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.user_order_status_id_seq OWNED BY public.user_order_status.id;
            public       postgres    false    203            �            1259    16859    user_orders    TABLE     �   CREATE TABLE public.user_orders (
    id bigint NOT NULL,
    order_id bigint,
    user_id bigint,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.user_orders;
       public         postgres    false            �            1259    16857    user_orders_id_seq    SEQUENCE     {   CREATE SEQUENCE public.user_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.user_orders_id_seq;
       public       postgres    false    208            P           0    0    user_orders_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.user_orders_id_seq OWNED BY public.user_orders.id;
            public       postgres    false    207            �            1259    16772 	   user_role    TABLE     �   CREATE TABLE public.user_role (
    id bigint NOT NULL,
    title character varying(255),
    status boolean DEFAULT false NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.user_role;
       public         postgres    false            �            1259    16770    user_role_id_seq    SEQUENCE     y   CREATE SEQUENCE public.user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_role_id_seq;
       public       postgres    false    200            Q           0    0    user_role_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.user_role_id_seq OWNED BY public.user_role.id;
            public       postgres    false    199            �            1259    16781    users    TABLE     �  CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(255),
    name character varying(255),
    password_hash character varying(255),
    is_admin boolean DEFAULT false NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    address character varying(255),
    state character varying(255),
    city character varying(255),
    zipcode integer,
    user_role_id bigint
);
    DROP TABLE public.users;
       public         postgres    false            �            1259    16779    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false    202            R           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
            public       postgres    false    201            �
           2604    16766    order_status id    DEFAULT     r   ALTER TABLE ONLY public.order_status ALTER COLUMN id SET DEFAULT nextval('public.order_status_id_seq'::regclass);
 >   ALTER TABLE public.order_status ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    197    198            �
           2604    16846 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    206    206            �
           2604    16801    user_order_status id    DEFAULT     |   ALTER TABLE ONLY public.user_order_status ALTER COLUMN id SET DEFAULT nextval('public.user_order_status_id_seq'::regclass);
 C   ALTER TABLE public.user_order_status ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    203    204            �
           2604    16862    user_orders id    DEFAULT     p   ALTER TABLE ONLY public.user_orders ALTER COLUMN id SET DEFAULT nextval('public.user_orders_id_seq'::regclass);
 =   ALTER TABLE public.user_orders ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    208    207    208            �
           2604    16775    user_role id    DEFAULT     l   ALTER TABLE ONLY public.user_role ALTER COLUMN id SET DEFAULT nextval('public.user_role_id_seq'::regclass);
 ;   ALTER TABLE public.user_role ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    200    200            �
           2604    16784    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    202    202            <          0    16763    order_status 
   TABLE DATA               R   COPY public.order_status (id, title, status, inserted_at, updated_at) FROM stdin;
    public       postgres    false    198   �C       D          0    16843    orders 
   TABLE DATA                 COPY public.orders (id, patient_name, patient_email, patient_address, patient_state, patient_city, patient_zipcode, pickup_date, pickup_time, inserted_at, updated_at, order_number, courier_id, order_status, user_id, order_details, order_cancel_description, patient_contact) FROM stdin;
    public       postgres    false    206   �C       :          0    16745    schema_migrations 
   TABLE DATA               A   COPY public.schema_migrations (version, inserted_at) FROM stdin;
    public       postgres    false    196   tF       B          0    16798    user_order_status 
   TABLE DATA               �   COPY public.user_order_status (id, user_id, order_status_id, name, contact, email, address, state, city, zipcode, inserted_at, updated_at) FROM stdin;
    public       postgres    false    204   }G       F          0    16859    user_orders 
   TABLE DATA               U   COPY public.user_orders (id, order_id, user_id, inserted_at, updated_at) FROM stdin;
    public       postgres    false    208   �G       >          0    16772 	   user_role 
   TABLE DATA               O   COPY public.user_role (id, title, status, inserted_at, updated_at) FROM stdin;
    public       postgres    false    200   �G       @          0    16781    users 
   TABLE DATA               �   COPY public.users (id, email, name, password_hash, is_admin, inserted_at, updated_at, address, state, city, zipcode, user_role_id) FROM stdin;
    public       postgres    false    202   H       S           0    0    order_status_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.order_status_id_seq', 1, false);
            public       postgres    false    197            T           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 40, true);
            public       postgres    false    205            U           0    0    user_order_status_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.user_order_status_id_seq', 1, false);
            public       postgres    false    203            V           0    0    user_orders_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_orders_id_seq', 1, false);
            public       postgres    false    207            W           0    0    user_role_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.user_role_id_seq', 1, false);
            public       postgres    false    199            X           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 21, true);
            public       postgres    false    201            �
           2606    16769    order_status order_status_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT order_status_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.order_status DROP CONSTRAINT order_status_pkey;
       public         postgres    false    198            �
           2606    16851    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public         postgres    false    206            �
           2606    16749 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 R   ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       public         postgres    false    196            �
           2606    16806 (   user_order_status user_order_status_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.user_order_status
    ADD CONSTRAINT user_order_status_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.user_order_status DROP CONSTRAINT user_order_status_pkey;
       public         postgres    false    204            �
           2606    16864    user_orders user_orders_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.user_orders
    ADD CONSTRAINT user_orders_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.user_orders DROP CONSTRAINT user_orders_pkey;
       public         postgres    false    208            �
           2606    16778    user_role user_role_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.user_role DROP CONSTRAINT user_role_pkey;
       public         postgres    false    200            �
           2606    16790    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    202            �
           2606    32863    orders orders_users_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_users_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 E   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_users_id_fkey;
       public       postgres    false    202    206    2740            �
           2606    16812 8   user_order_status user_order_status_order_status_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_order_status
    ADD CONSTRAINT user_order_status_order_status_id_fkey FOREIGN KEY (order_status_id) REFERENCES public.order_status(id);
 b   ALTER TABLE ONLY public.user_order_status DROP CONSTRAINT user_order_status_order_status_id_fkey;
       public       postgres    false    198    204    2736            �
           2606    16807 0   user_order_status user_order_status_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_order_status
    ADD CONSTRAINT user_order_status_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 Z   ALTER TABLE ONLY public.user_order_status DROP CONSTRAINT user_order_status_user_id_fkey;
       public       postgres    false    204    202    2740            �
           2606    16865 %   user_orders user_orders_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_orders
    ADD CONSTRAINT user_orders_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);
 O   ALTER TABLE ONLY public.user_orders DROP CONSTRAINT user_orders_order_id_fkey;
       public       postgres    false    2744    208    206            �
           2606    16870 $   user_orders user_orders_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_orders
    ADD CONSTRAINT user_orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 N   ALTER TABLE ONLY public.user_orders DROP CONSTRAINT user_orders_user_id_fkey;
       public       postgres    false    2740    202    208            �
           2606    24676    users users_user_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_role_id_fkey FOREIGN KEY (user_role_id) REFERENCES public.user_role(id);
 G   ALTER TABLE ONLY public.users DROP CONSTRAINT users_user_role_id_fkey;
       public       postgres    false    202    2738    200            <   N   x�3��K-�,�420��54�50S02�26�24�365�%�e�钚�Y�Z��B�n#N�ļ���4�p��P`y� yj3�      D   y  x����N�0��ݧ�P���Il_�+m+�i7n�4.iЮ<��A����-'��|��sDDn�m]7������Vie?,V֕l^��9=atZd�~,ש��]צ�̎��'UF��m�򺩜�C:��-��ަ�����SW-
��.lsD �<F����� ��5�C�P��k�c��iKQFr���(!�������?�猀&��µԏ���I���Y�Zj�鲶��o�y�i�����@[몎n\YҶk��#������n5�k���+(��s��0!Y"��M�ۑ��-/�y��"{���!S�5�q��+rf�5��r�7;y~W-��5�Vq0��d�GF�Ŕ҇��p�����?5���w/�A�b�yz����Jj)"!W=�����iO�w _@AeD�4�D~�)��[����en�H���z�,��Y��E�y^:!���������
[b#�4�'4����'g����Mҏ���!�$�B��@���O��D�h�$��O`\@ X������� �Zc�"#i�m��>���Y��͙4jnl���W��E�7�P=�/���c�}Q��)�:��F"�/��	����??-���6�vy�}(�l0�f��      :   �   x�m��m�0�︊m`�^:jI�u��E,��x ������#��&��|8X�䐅Y�Y�+���5ܘP���bw��X�+���ز@�g����A)"�])�e�\���,�k��3����E���o����4r������̍�_��BP��WF����5�/��2����fg��9[]�Ȇ9���T����L#/)�X![V�մf$�eY��z?Y�մ��am����Ϣ��9~�q��)      B      x������ � �      F      x������ � �      >   @   x�3�tL����,�420��54"+0�&�e���X���\I�&cN��Ң��"���qqq �� �      @   ,  x�u�;o�0������v^�8ДQ�B��%BqBPʯ/�Y��r�r>
(ި,�7�npR(4�������uhכ��\��d'�9�c���4Fٹ殤��k���]Q�j%�{@z��P� qt�m�>�-���h�QR��LV�OU����Y.e�'�[~��E\�>�����&Mf�!�'Ղ
&��^��͹���df����4o˘F	:��J�m�}���S��t�Ed�ޮ��I/������=Om��4=�»Z&ڶ��!�Cn<��,����iN�y�     