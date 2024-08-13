pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function load_table(s,stc)
	s = sub(s,2)
	-- -1 none
	-- 0 string
	-- 1 table
	-- 2 other 
	local vat = -1
	local cv = ""
	local ck = ""
	local ik = true
	local t = {}
	local added = false
	local te = 0
	local skip = nil
	for i=1,#s do
		if skip != nil and i <= skip then
			goto cn
		end
		te = i
		local c=s[i]
		if c == " " or c == "\n" or c == "	" then
			if vat != 0 then
				goto cn
			end
		end
		if c == "\"" then
			if vat == 0 then
				vat = -1
				goto cn
			else
				vat = 0
				goto cn
			end
		end
		if c == "," and vat != 0 then
			t[ck] = cv
			ik=true
			cv=""
			ck=""
			goto cn
		end
		if c == "{" then
			ts = i
			st,te=load_table(sub(s,ts),true)
			t[ck] = st
			ik=true
			cv=""
			ck=""
			skip = te+i
			goto cn
		elseif c == "}" then
			if ck != "" then
				t[ck] = cv
			end
			if stc == true then
				return t, te
			else
				return t
			end
		end
		if ik == true then
			if c == "=" then
				ik = false
			else
				ck = ck..c
			end
		else
			cv = cv..c
		end
		::cn::
	end
	if ck != "" then
		t[ck] = cv
	end
	if stc == true then
		return t, te
	else
		return t
	end
end

function _init()
	s = [[{
		w="howdy,friend",
		h=1,
		jj=2,
		horace={
			yo=1,
			fro="free",
			yoyo={yoyo={yoyo=1}}
		}
	}]]
	t = load_table(s)
	print(dump(t))
end
-->8
function dump(t,ind)
	--stringify table
	s = ""
	if ind == nil then
		s = s.."{\n"
	end
	local indl = ind or 1
	local	indent = ""
	for i=1,indl do
		indent = indent.." "
	end
	for k,v in pairs(t) do
		if type(v) == "table" then
			s = s..indent..k..":{\n"..dump(v,indl+1)..indent.."}\n"
		elseif type(v) == "string" then
			s = s..indent..k..":\""..tostr(v).."\"\n"
		else
			s = s..indent..k..":"..tostr(v).."\n"
		end
	end
	if ind == nil then
		s = s.."}"
	end
	return s
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
