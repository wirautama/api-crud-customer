<?php

namespace App\Http\Controllers\API;

use App\Helpers\ApiFormatter;
use App\Http\Controllers\Controller;
use App\Models\Customer;
use Exception;
use Illuminate\Http\Request;



class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Customer::all();
        if ($data) {
            return ApiFormatter::createAPI(200, 'Success', $data);
        } else {
            return ApiFormatter::createAPI(400, 'Failed');
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            $request->validate([
                'sales_id' => 'required',
                'nama' => 'required',
                'no_tlpn' => 'required',
                'alamat' => 'required',
                'status' => 'required',
                'metode_ketemu' => 'required'
            ]);
            $customer = Customer::create([
                'sales_id' => $request->sales_id,
                'nama' => $request->nama,
                'no_tlpn' => $request->no_tlpn,
                'alamat' => $request->alamat,
                'status' => $request->status,
                'metode_ketemu' => $request->metode_ketemu
            ]);

            $data = Customer::where('id', '=', $customer->id)->get();
            if ($data) {
                return ApiFormatter::createAPI(201, 'Success', $data);
            } else {
                return ApiFormatter::createAPI(400, 'Failed');
            }
        } catch (Exception $error) {
            return ApiFormatter::createAPI(400, 'Failed');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data = Customer::where('id', '=', $id)->get();
        if ($data) {
            return ApiFormatter::createAPI(200, 'Success', $data);
        } else {
            return ApiFormatter::createAPI(400, 'Failed');
        }
        return ApiFormatter::createAPI(400, 'Failed');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try {
            $request->validate([
                'sales_id' => 'required',
                'nama' => 'required',
                'no_tlpn' => 'required',
                'alamat' => 'required',
                'status' => 'required',
                'metode_ketemu' => 'required'
            ]);

            $customer = Customer::findOrFail($id);
            $customer->update([
                'sales_id' => $request->sales_id,
                'nama' => $request->nama,
                'no_tlpn' => $request->no_tlpn,
                'alamat' => $request->alamat,
                'status' => $request->status,
                'metode_ketemu' => $request->metode_ketemu
            ]);

            $data = Customer::where('id', '=', $customer->id)->get();
            if ($data) {
                return ApiFormatter::createAPI(201, 'Success', $data);
            } else {
                return ApiFormatter::createAPI(400, 'Failed');
            }
        } catch (Exception $error) {
            return ApiFormatter::createAPI(400, 'Failed');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $customer = Customer::findOrFail($id);

            $data = $customer->delete();

            if ($data) {
                return ApiFormatter::createAPI(201, 'Success Destroy Data');
            } else {
                return ApiFormatter::createAPI(400, 'Failed');
            }
        } catch (Exception $error) {
            return ApiFormatter::createAPI(400, 'Failed');
        }
    }
}
